//
//  Created by Abhi Makadiya on 17/03/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd. All rights reserved.
//

import UIKit
//
//protocol KeyboardHandler: UIViewController {
//    var barBottomConstraint: NSLayoutConstraint! { get }
//    var keyboardShowObserver: NSObjectProtocol? { get set }
//    var keyboardHideObserver: NSObjectProtocol? { get set }
//}
//
//extension KeyboardHandler {
//    func addKeyboardObservers() {
//        keyboardShowObserver = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] (notification) in
//            self?.handleKeyboard(notification: notification)
//        }
//        keyboardHideObserver = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] (notification) in
//            self?.handleKeyboard(notification: notification)
//        }
//    }
//
//    private func handleKeyboard(notification: Notification) {
//        guard let userInfo = notification.userInfo else { return }
//        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
//        barBottomConstraint.constant = notification.name == UIResponder.keyboardWillHideNotification ? 0 : keyboardFrame.height - view.safeAreaInsets.bottom
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
//    }
//
//    func removeKeyboardObservers() {
//        if let keyboardShowObserver = keyboardShowObserver {
//            NotificationCenter.default.removeObserver(keyboardShowObserver)
//        }
//        if let keyboardHideObserver = keyboardHideObserver {
//            NotificationCenter.default.removeObserver(keyboardHideObserver)
//        }
//    }
//}
