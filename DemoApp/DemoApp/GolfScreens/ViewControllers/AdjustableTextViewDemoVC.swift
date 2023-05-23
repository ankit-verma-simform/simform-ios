//
//  AdjustableTextViewDemoVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 23/05/23.
//

import UIKit

class AdjustableTextViewDemoVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var adjustableTextView: UITextView!
    @IBOutlet private weak var constAdjustableTextViewHeight: NSLayoutConstraint!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        adjustableTextView.layer.cornerRadius = 5
        adjustableTextView.isScrollEnabled = false
        adjustableTextView.delegate = self
        textViewDidChange(adjustableTextView)
    }
}

// MARK: - Text View Delegate Methods
extension AdjustableTextViewDemoVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: adjustableTextView.bounds.size.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        if estimatedSize.height > 500 {
            adjustableTextView.isScrollEnabled = true
            constAdjustableTextViewHeight.constant = 500
        } else {
            constAdjustableTextViewHeight.constant  = estimatedSize.height
        }
    }
}
