//
//  GolfHomeHeaderView.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit

class GolfHomeHeaderView: UIView {
    // MARK: - Variables
    private let golfGameTypes = [
        1, 2, 3
    ]

    // MARK: - IB Outlets
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var golfGameTypesStackView: UIStackView!
    
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
extension GolfHomeHeaderView {
    private func commonInit() {
        initializeSubViews()
        containerView.backgroundColor = .systemGray6
        for golfGameType in golfGameTypes {
            let golfGameTypeView = GolfGameTypeView()
            golfGameTypesStackView.addArrangedSubview(golfGameTypeView)
        }
    }
    
    private func initializeSubViews() {
        let nib = UINib(nibName: "GolfHomeHeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        containerView.frame = bounds
        addSubview(containerView)
    }
}
