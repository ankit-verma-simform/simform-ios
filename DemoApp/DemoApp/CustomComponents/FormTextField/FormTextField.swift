//
//  FormTextField.swift
//  DemoApp
//
//  Created by Ankit Verma on 20/04/23.
//

import UIKit

class FormTextField: UIView {
    
    // MARK: IB Outlets
    @IBOutlet weak var contentView: UIView!
    
    // MARK: View Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // common initializer to initialize and setup the view
    private func commonInit() {
        Bundle.main.loadNibNamed("FormTextField", owner: self)
        addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
