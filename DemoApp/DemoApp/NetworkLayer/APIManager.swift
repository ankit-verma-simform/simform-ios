//
//  APIManager.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.


import Alamofire
import UIKit
import Reachability

class APIManager: NetworkManger {

    // MARK: Vars & Lets
    let reachability = try? Reachability()
    private let sessionManager: SessionManager
    private let retrier: APIManagerRetrier
    private let adapter: APIManagerAdapter
    static let errorCodeList =  [400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 421, 422, 423, 424, 425, 426, 427, 428, 429, 431, 451, 500, -1009, -1001]
    let imageCache = NSCache<NSString, UIImage>()

    // MARK: Public methods
    static var shared: APIManager {
        return APIManager(sessionManager: SessionManager(), retrier: APIManagerRetrier(), adapter: APIManagerAdapter())
    }

    func call(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<(), CustomError>) -> Void) {
        if reachability?.connection ?? .unavailable != .unavailable {
            self.sessionManager.request(type.url,
                                        method: type.httpMethod,
                                        parameters: params,
                                        encoding: type.encoding,
                                        headers: type.headers).validate().responseJSON { (data) in
                                            if self.handleResponseCode(res: data) {
                                                switch data.result {
                                                case .success:
                                                    handler(.success(()))
                                                case .failure:
                                                    handler(.failure(self.parseApiError(dataResponse: data)))
                                                }
                                            } else {
                                                handler(.failure(self.parseApiError(dataResponse: data)))
                                            }
            }
        } else {
            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
        }
    }

    func call<T>(type: RequestItemsType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        if reachability?.connection ?? .unavailable != .unavailable {

            self.sessionManager.request(type.url,
                                        method: type.httpMethod,
                                        parameters: params,
                                        encoding: type.encoding,
                                        headers: type.headers).validate().responseJSON { (data) in
                                            if self.handleResponseCode(res: data) {
                                                do {
                                                    guard let jsonData = data.data else {
                                                        throw CustomError(title: APIError.defaultAlertTitle, body: APIError.noData)
                                                    }
                                                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                                                    handler(.success(result))
                                                    self.resetNumberOfRetries()
                                                } catch {
                                                    if let error = error as? CustomError {
                                                        return handler(.failure(error))
                                                    }
                                                    handler(.failure(self.parseApiError(dataResponse: data)))
                                                }
                                            } else {
                                                handler(.failure(self.parseApiError(dataResponse: data)))
                                            }
            }
        } else {
            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
        }
    }

    func call<T>(type: RequestItemsType, files: [UploadFileRequest], params: Parameters? = nil, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        if reachability?.connection != Reachability.Connection.unavailable {
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if let params = params {
                    for (key, value) in params where (value as AnyObject).description != nil {
                        if let jsonData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                            multipartFormData.append(jsonData, withName: key as String)
                        }
                    }
                }
                files.forEach { (file) in
                    multipartFormData.append(file.fileData, withName: file.paramName, fileName: file.fileName.lowercased(), mimeType: file.mimeType)
                }
            }, to: type.url, method: type.httpMethod, headers: type.headers, encodingCompletion: { (encodingResult) in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { data in
                        if self.handleResponseCode(res: data) {
                            do {
                                guard let jsonData = data.data else {
                                    throw CustomError(title: APIError.defaultAlertTitle, body: APIError.noData)
                                }
                                let result = try JSONDecoder().decode(T.self, from: jsonData)
                                handler(.success(result))
                                self.resetNumberOfRetries()
                            } catch {
                                if let error = error as? CustomError {
                                    return handler(.failure(error))
                                }
                                handler(.failure(self.parseApiError(dataResponse: data)))
                            }
                        } else {
                            handler(.failure(self.parseApiError(dataResponse: data)))
                        }
                    }
                case .failure(let encodingError):
                    handler(.failure(CustomError(title: R.string.localizable.appName(), body: encodingError.localizedDescription)))
                }
            })
        } else {
            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
        }
    }

    // MARK: Private methods

    private func resetNumberOfRetries() {
        self.retrier.numberOfRetries = 0
    }

    /// Handle response code
    ///
    /// - Parameter res: api response
    /// - Returns: returns true if response status is sucess else false
    private func handleResponseCode(res: DataResponse<Any>?) -> Bool {
        if let data = res?.data {
            let strResp = String(decoding: data, as: UTF8.self)
            if let dictResp = convertStringToDictionary(text: strResp) {
                if dictResp.keys.contains("status") {
                    let statusCode = getInteger(anything: dictResp["status"])
                    if statusCode == 403 {
                        //NotificationCenter.default.post(name: .logout, object: nil)
                    }
                }
            }
        }
        var isSuccess: Bool = false
        guard let dataResponse = res else {
            return isSuccess
        }
        guard let response = dataResponse.response else {
            return isSuccess
        }
        switch response.statusCode {
        case 200...300:
            isSuccess = true
        default: break
        }
        return isSuccess
    }

    func convertStringToDictionary(text: String) -> [String: AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
                return json
            } catch {
            }
        }
        return nil
    }

    // MARK: Initialization

    init(sessionManager: SessionManager, retrier: APIManagerRetrier, adapter: APIManagerAdapter) {
        self.sessionManager = sessionManager
        self.retrier = retrier
        self.sessionManager.retrier = self.retrier
        self.adapter = adapter
        self.sessionManager.adapter = adapter
    }
}
