//
//  ColorController.swift
//  CompositionalCollectionLayouts
//
//  Created by Angel Buenrostro on 3/29/20.
//  Copyright © 2020 Angel Buenrostro. All rights reserved.
//

import Foundation
import UIKit

class ColorController {
    
    var colors: [ColorSwatch] = [ColorSwatch(name: "blue", color: UIColor.systemBlue), ColorSwatch(name: "pink", color: UIColor.systemPink)]
    var favorites: [ColorSwatch] = [ColorSwatch(name: "indigo", color: UIColor.systemIndigo, favorite: true)]
    
    func updateColors() {
        let newFavorites = colors.filter({ $0.favorite })
        for color in newFavorites { favorites.append(color) }
        colors = colors.filter({ !$0.favorite })
        favorites = favorites.filter({ $0.favorite == true })
    }
    
    func addRandomColor() {
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        let newColor = ColorSwatch(name: "", color: randomColor)
        colors.append(newColor)
    }
}
