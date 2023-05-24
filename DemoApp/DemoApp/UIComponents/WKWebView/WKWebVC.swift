//
//  WKWebVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 04/05/23.
//

import UIKit
import WebKit

class WKWebVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension WKWebVC {
    private func initialSetup() {
        searchBar.delegate = self
        webView.navigationDelegate = self
    }
}

// MARK: - UISearchBar Delegate Methods
extension WKWebVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard   let query = searchBar.text,
                let url = URL(string: "https://www.google.com/search?q=\(query)") else {
            return
        }
        let request = URLRequest(url: url)
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }
            self.webView.load(request)
        }
    }
}

// MARK: - WKWebView Navigation Delegate Methods
extension WKWebVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        guard let host = navigationAction.request.url?.host,
              host == "www.google.com" else {
            return .cancel
        }
        return .allow
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
