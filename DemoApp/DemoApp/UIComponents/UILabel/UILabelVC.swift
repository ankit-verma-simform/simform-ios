//
//  UILabelVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 12/04/23.
//

import UIKit

class UILabelVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var lblProgrammed: UILabel!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyLabelProperties()
    }
}

// MARK: Functions
extension UILabelVC {
    
    func modifyLabelProperties() {
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
        lblProgrammed.font = .preferredFont(forTextStyle: .largeTitle)
        
        lblProgrammed.shadowColor = .cyan
        lblProgrammed.shadowOffset = CGSize(width: 10, height: 10)
    }
}
