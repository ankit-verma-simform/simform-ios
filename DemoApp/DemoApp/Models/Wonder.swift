//
//  Wonder.swift
//  DemoApp
//
//  Created by Ankit Verma on 08/05/23.
//

import Foundation

struct Wonder {
    let name: String
    let coords: (latitude: Double, longitude: Double)
    
    static func getSevenWonders() -> [Wonder] {
        return [
            Wonder(name: "Great Wall of China", coords: (latitude: 40.432642685107474, longitude: 116.57046073068217)),
            Wonder(name: "Chichén Itzá", coords: (latitude: 20.684907209169534, longitude: -88.56773968465893)),
            Wonder(name: "Petra", coords: (latitude: 30.329250803182784, longitude: 35.44466260738756)),
            Wonder(name: "Machu Picchu", coords: (latitude: -13.219221470548922, longitude: -72.49704790047491)),
            Wonder(name: "Christ the Redeemer", coords: (latitude: -22.951698630919925, longitude: -43.21047647471116)),
            Wonder(name: "Colosseum", coords: (latitude: 41.89036990745619, longitude: 12.492263083366145)),
            Wonder(name: "Taj Mahal", coords: (latitude: 27.175345211423128, longitude: 78.04213146753122)),
        ]
    }
}
