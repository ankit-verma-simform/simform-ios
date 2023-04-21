//
//  UITextViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 13/04/23.
//

import UIKit

class UITextViewVC: UIViewController  {
    // MARK: IB Outlets
    @IBOutlet private weak var tvNote: UITextView!
    
    // MARK: View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tvNote.font = .robotoItalic()
        tvNote.delegate = self
        tvNote.addDoneButtonOnKeyboard()
    }
}

// MARK: Functions
extension UITextViewVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Begin editing")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("Finished editing")
        tvNote.dataDetectorTypes = UIDataDetectorTypes.all
        tvNote.isEditable = false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("Text changed")
    }
    
    func textView(
        _ textView: UITextView,
        shouldInteractWith URL: URL,
        in characterRange: NSRange) -> Bool {
        if URL.absoluteString.contains("google") {
            return false
        }
        return true
    }
}
