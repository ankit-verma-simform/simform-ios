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
    private var selectedGolfTypeIndex = 0

    // MARK: - IB Outlets
    @IBOutlet private var containerView: UIView!
    @IBOutlet private weak var golfGameTypesStackView: UIStackView!
    @IBOutlet private weak var gameStatusStackView: UIStackView!
    @IBOutlet private weak var btnUpdateScore: UIButton!
    @IBOutlet private weak var cardItemsStackView: UIStackView!
    @IBOutlet private weak var lblExtraCards: UILabel!
    @IBOutlet private weak var lblNumberOfHoles: UILabel!
    @IBOutlet private weak var lblAmount: UILabel!
    @IBOutlet private weak var imgAmountPot: UIImageView!
    @IBOutlet private weak var cardsStackView: UIStackView!
    
    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    init() {
        super.init(frame: .zero)
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
        selectedGolfTypeIndex = golfGame.selectedGolfGameIndex
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
        if let golfTypeView = golfGameTypesStackView.arrangedSubviews[selectedGolfTypeIndex] as? GolfGameTypeView {
            golfTypeView.highlight()
        }
        golfGameTypesStackView.roundCorners(cornerRadius: 20)
    }
    
    private func setupGameStatus() {
        gameStatusStackView.roundCorners(cornerRadius: 20)
    }
    
    private func setupUpdateScore() {
        btnUpdateScore.layer.shadowColor = UIColor.black.cgColor
        btnUpdateScore.layer.shadowOpacity = 0.15
        btnUpdateScore.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnUpdateScore.layer.shadowRadius = 0
        btnUpdateScore.layer.masksToBounds = false
    }
    
    private func setupCardItems() {
        for (index, card) in cards.enumerated() {
            if index >= cards.count || index >= numberOfCardsToShow {
                break
            }
            let cardImageView = UIImageView(image: card.image)
            cardItemsStackView.addArrangedSubview(cardImageView)
        }
        if cards.count == 0 {
            cardsStackView.isHidden = true
        }
        if numberOfCardsToShow >= cards.count {
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
        for (index, golfTypeView) in golfTypeViews.enumerated() {
            if let golfType = golfTypeView.golfType,
               golfType.name == view.golfType?.name {
                golfTypeView.highlight()
                selectedGolfTypeIndex = index
                print(selectedGolfTypeIndex)
            } else {
                golfTypeView.dehighlight()
            }
        }
    }
}
