//
//  GolfGame.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/05/23.
//

import UIKit

struct GolfGame {
    let gameTypes: [GolfGameType]
    var selectedGolfGameIndex: Int
    var numberOfHoles: Int
    let amount: Int
    let cards: [Card]
    let numberOfCardsToShow: Int
    var groups: [Group]
}

struct GolfGameType {
    let image: UIImage?
    let name: String
}

struct Group {
    let name: String
    var players: [Player]
    var isMessageSentToAllPlayers: Bool {
        players.allSatisfy { $0.isMessageSent }
    }
}

struct Player {
    let name: String
    var cardsEarned: Int
    var penalties: Double
    var isMessageSent: Bool = false
}

struct Card {
    let image: UIImage?
}

extension GolfGame {
    static func getGame() -> GolfGame {
        return GolfGame(
            gameTypes: [
                GolfGameType(image: Constants.Image.iconsIllustrationGolfPoker,
                             name: Constants.String.golfPoker),
                GolfGameType(image: Constants.Image.iconsIllustrationClosestToPin,
                             name: Constants.String.closestToPin),
                GolfGameType(image: Constants.Image.iconsIllustrationSkins,
                             name: Constants.String.skins),
            ],
            selectedGolfGameIndex: 0,
            numberOfHoles: 2,
            amount: 0,
            cards: [
                Card(image: Constants.Image.iconsCard),
                Card(image: Constants.Image.iconsCard),
                Card(image: Constants.Image.iconsCard),
                Card(image: Constants.Image.iconsCard),
                Card(image: Constants.Image.iconsCard),
            ],
            numberOfCardsToShow: 3,
            groups: [
                Group(
                    name: "Group A",
                    players: [
                        Player(name: "You", cardsEarned: 0, penalties: 12),
                        Player(name: "Gail Forcewind", cardsEarned: 6, penalties: 12),
                        Player(name: "Mario Spewagon", cardsEarned: 5, penalties: 12),
                        Player(name: "Anna Asthenia", cardsEarned: 4, penalties: 12),
                    ]),
                Group(
                    name: "Group B",
                    players: [
                        Player(name: "Holly Goodhead", cardsEarned: 5, penalties: 12),
                        Player(name: "Simon Cyrene", cardsEarned: 6, penalties: 12),
                        Player(name: "Lupe Lamora", cardsEarned: 5, penalties: 12),
                        Player(name: "Dustin Spewagon", cardsEarned: 4, penalties: 12),
                    ]),
                Group(
                    name: "Group C",
                    players: [
                        Player(name: "Gail Goodhead", cardsEarned: 5, penalties: 12),
                        Player(name: "Simon Cyrene", cardsEarned: 3, penalties: 12),
                        Player(name: "Anna Lamora", cardsEarned: 4, penalties: 12),
                        Player(name: "Dustin Trailblazer", cardsEarned: 4, penalties: 12),
                    ]),
            ])
    }
}
