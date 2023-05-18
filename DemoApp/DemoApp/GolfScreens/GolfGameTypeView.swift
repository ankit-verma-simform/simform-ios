//
//  GolfGameTypeView.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit

protocol GolfTypeDelegate: AnyObject {
    func didTouchAtGolfType(_ golfType: GolfGameType, view: GolfGameTypeView)
}

class GolfGameTypeView: UIView {
    // MARK: - Variables
    private (set) var golfType: GolfGameType?
    weak var delegate: GolfTypeDelegate?

    // MARK: - IB Outlets
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var lblGolfTypeName: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let golfType else {
            return
        }
        delegate?.didTouchAtGolfType(golfType, view: self)
    }
}

// MARK: - Functions
extension GolfGameTypeView {
    private func commonInit() {
        initializeSubViews()
        dehighlight()
    }
    
    private func initializeSubViews() {
        let nib = UINib(nibName: "GolfGameTypeView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        containerView.frame = bounds
        addSubview(containerView)
    }
    
    func configure(with golfType: GolfGameType) {
        self.golfType = golfType
        lblGolfTypeName.text = golfType.name
        img.image = golfType.image
    }
    
    func highlight() {
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.green.cgColor
        img.alpha = 1
        lblGolfTypeName.alpha = 1
    }
    
    func dehighlight() {
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 0
        containerView.layer.borderWidth = 0
        img.alpha = 0.2
        lblGolfTypeName.alpha = 0.2
    }
}
