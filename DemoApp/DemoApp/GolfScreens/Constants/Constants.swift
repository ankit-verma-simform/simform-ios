//
//  Constants.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/05/23.
//

import UIKit

struct Constants {
    struct Image {
        static let crowns = UIImage(named: "crowns")
        static let emptyPot = UIImage(named: "emptyPot")
        static let fullPot = UIImage(named: "fullPot")
        static let halfFill = UIImage(named: "halfFill")
        static let iconsCard = UIImage(named: "iconsCard")
        static let iconsIllustrationClosestToPin = UIImage(named: "iconsIllustrationClosestToPin")
        static let iconsIllustrationGolfPoker = UIImage(named: "iconsIllustrationGolfPoker")
        static let iconsIllustrationSkins = UIImage(named: "iconsIllustrationSkins")
        static let iconsMessage = UIImage(named: "iconsMessage")
        static let playingCards = UIImage(named: "playingCards")
        static let iconCheckMark = UIImage(systemName: "checkmark")
    }
    
    struct String {
        static let golfPoker = "Golf Poker"
        static let closestToPin = "Closest to Pin"
        static let skins = "Skins"
    }
    
    struct Color {
        static let lightWhite = CGColor(red: 255, green: 255, blue: 255, alpha: 0.2)
    }
}
