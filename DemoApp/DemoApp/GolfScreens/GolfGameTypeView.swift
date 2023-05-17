//
//  GolfGameTypeView.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit

class GolfGameTypeView: UIView {
    // MARK: - IB Outlets
    @IBOutlet private var containerView: UIView!
    
    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

// MARK: - Functions
extension GolfGameTypeView {
    private func commonInit() {
        initializeSubViews()
        containerView.backgroundColor = .white
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 30
        containerView.layer.borderWidth = 5
        containerView.layer.borderColor = UIColor.green.cgColor
    }
    
    private func initializeSubViews() {
        let nib = UINib(nibName: "GolfGameTypeView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        containerView.frame = bounds
        addSubview(containerView)
    }
}
