//
//  UILabelVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 12/04/23.
//

import UIKit

class UILabelVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var lblProgrammed: UILabel!
    @IBOutlet private weak var lblAttributed: UILabel!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyLabelProperties()
        customizeAttributedText()
    }
}

// MARK: - Functions
extension UILabelVC {
    private func modifyLabelProperties() {
        let customText = """
        This is some custom text written programmatically
        
        UILabel Props:
            - text
            - numberOfLines
            - textColor
            - font
            - ...
        """
        lblProgrammed.text = customText
        lblProgrammed.numberOfLines = 0
        lblProgrammed.textAlignment = .justified
        lblProgrammed.textColor = .magenta
        lblProgrammed.font = .preferredFont(forTextStyle: .body)
        lblProgrammed.shadowColor = .cyan
        lblProgrammed.shadowOffset = CGSize(width: 10, height: 7)
    }
    
    private func customizeAttributedText() {
        // adding some text with red color
        let redString = "Sample string with red color "
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.red]
        let attrMyString = NSMutableAttributedString(string: redString, attributes: attrs)
        // adding some more text
        attrMyString.append(NSAttributedString(string: "\nthis is some normal text "))
        attrMyString.append(
            NSAttributedString(
                string: "\nthis is custom font text ",
                attributes: [NSAttributedString.Key.font: UIFont(
                    name: "Chalkduster",
                    size: 18.0)!]))
        // underline part of text using range
        let myRange = NSRange(location: 4, length: 14)
        attrMyString.addAttributes(
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.double.rawValue,
             NSAttributedString.Key.underlineColor: UIColor.systemBlue],
            range: myRange)
        // setting it to handle multiple line
        lblAttributed.attributedText = attrMyString
        lblAttributed.numberOfLines = 0
        lblAttributed.textAlignment = NSTextAlignment.justified
    }
}
