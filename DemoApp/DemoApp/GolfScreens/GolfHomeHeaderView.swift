//
//  GolfHomeHeaderView.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit

class GolfHomeHeaderView: UIView {
    // MARK: - Variables
    private var golfGameTypes = [GolfGameType]()
    private var cards = [Card]()
    private var numberOfCardsToShow = 0

    // MARK: - IB Outlets
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var golfGameTypesStackView: UIStackView!
    @IBOutlet private weak var gameStatusStackView: UIStackView!
    @IBOutlet private weak var btnUpdateScore: UIButton!
    @IBOutlet private weak var cardItemsStackView: UIStackView!
    @IBOutlet weak var lblExtraCards: UILabel!
    @IBOutlet weak var lblNumberOfHoles: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var imgAmountPot: UIImageView!
    @IBOutlet weak var cardsStackView: UIStackView!
    
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
    }
    
    func configure(with golfGame: GolfGame) {
        golfGameTypes = golfGame.gameTypes
        cards = golfGame.cards
        numberOfCardsToShow = golfGame.numberOfCardsToShow
        setupGolfTypes()
        setupGameStatus()
        setupUpdateScore()
        setupCardItems()
        lblNumberOfHoles.text = "Hole \(golfGame.numberOfHoles)"
        lblAmount.text = "$\(golfGame.amount)"
        setupAmountPot(golfGame.amount)
    }
    
    private func initializeSubViews() {
        let nib = UINib(nibName: "GolfHomeHeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        containerView.frame = bounds
        addSubview(containerView)
    }
    
    private func setupGolfTypes() {
        for golfGameType in golfGameTypes {
            let golfGameTypeView = GolfGameTypeView()
            golfGameTypeView.delegate = self
            golfGameTypeView.configure(with: golfGameType)
            golfGameTypesStackView.addArrangedSubview(golfGameTypeView)
        }
        if let golfTypeView = golfGameTypesStackView.arrangedSubviews.first as? GolfGameTypeView {
            golfTypeView.highlight()
        }
        golfGameTypesStackView.layer.cornerRadius = 20
        golfGameTypesStackView.layer.masksToBounds = true
    }
    
    private func setupGameStatus() {
        gameStatusStackView.layer.cornerRadius = 20
        gameStatusStackView.layer.masksToBounds = true
    }
    
    private func setupUpdateScore() {
        btnUpdateScore.layer.shadowColor = UIColor.black.cgColor
        btnUpdateScore.layer.shadowOffset = CGSize(width: 1, height: 5)
    }
    
    private func setupCardItems() {
        for (index, card) in cards.enumerated() {
            if index >= cards.count || index >= numberOfCardsToShow {
                break
            }
            let cardImageView = UIImageView(image: card.image)
            cardItemsStackView.addArrangedSubview(cardImageView)
        }
        if numberOfCardsToShow == 0 {
            cardsStackView.isHidden = true
        }
        if numberOfCardsToShow == cards.count {
            lblExtraCards.text = ""
        } else {
            lblExtraCards.text = String("+\(cards.count - numberOfCardsToShow)")
        }
    }
    
    private func setupAmountPot(_ amount: Int) {
        switch amount {
        case 0:
            imgAmountPot.image = Constants.Image.emptyPot
        case 1..<100:
            imgAmountPot.image = Constants.Image.halfFill
        case 100...:
            imgAmountPot.image = Constants.Image.fullPot
        default:
            imgAmountPot.image = Constants.Image.emptyPot
        }
    }
}

// MARK: - GolfType Delegate Methods
extension GolfHomeHeaderView: GolfTypeDelegate {
    func didTouchAtGolfType(_ golfType: GolfGameType, view: GolfGameTypeView) {
        view.highlight()
        guard let golfTypeViews = golfGameTypesStackView.arrangedSubviews as? [GolfGameTypeView] else {
            return
        }
        for golfTypeView in golfTypeViews {
            if let golfType = golfTypeView.golfType,
               golfType.name == view.golfType?.name {
                golfTypeView.highlight()
            } else {
                golfTypeView.dehighlight()
            }
        }
    }
}
