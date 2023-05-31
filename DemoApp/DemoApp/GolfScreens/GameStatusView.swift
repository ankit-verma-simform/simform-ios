//
//  GameStatusView.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/05/23.
//

import UIKit

class GameStatusView: UIView {
    // MARK: - Variables
    private var showGameSummary = true

    // MARK: - IB Outlets
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var lblSummary: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    // MARK: - View Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        toggleCard()
    }
}

// MARK: - Functions
extension GameStatusView {
    private func commonInit() {
        initializeSubViews()
        configure()
    }
    
    private func initializeSubViews() {
        let nib = UINib(nibName: "GameStatusView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        containerView.frame = bounds
        addSubview(containerView)
    }
    
    private func configure() {
        containerView.roundCorners(cornerRadius: 20)
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
    }
    
    private func toggleCard() {
        showGameSummary = !showGameSummary
        if showGameSummary {
            img.image = Constants.Image.playingCards
            lblSummary.text = "View Game\nSummary"
        } else {
            img.image = Constants.Image.crowns
            lblSummary.text = "Game Over?\nLet's see who won"
        }
    }
}
