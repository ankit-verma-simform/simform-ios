//
//  UIViewController+Extension.swift
//  DemoApp
//
//  Created by Ankit Verma on 12/04/23.
//

import UIKit

extension UIViewController {
    static func create<T: UIViewController>(storyboardName: Storyboard) -> T? {
        let storyboard = UIStoryboard.init(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T
    }
    
    func navigate(to viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}
