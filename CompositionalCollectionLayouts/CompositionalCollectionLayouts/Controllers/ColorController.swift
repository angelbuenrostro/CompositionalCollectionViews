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
    
    var colors: [Color] = [Color(name: "blue", color: UIColor.systemBlue), Color(name: "pink", color: UIColor.systemPink)]
    var favorites: [Color] = [Color(name: "raspberry", color: UIColor.systemIndigo, favorite: true)]
    
    func favorite(_ color: Color) {
        var newColor = Color(oldColor: color)
        newColor.favorite.toggle()
        
        if color.favorite {
            guard let index = favorites.firstIndex(where: { $0 == color }) else { return }
            favorites.remove(at: index)
            colors.append(newColor)
        } else {
            guard let index = colors.firstIndex(where: { $0 == color }) else { return }
            colors.remove(at: index)
            favorites.insert(newColor, at: 0)
        }
    }
    
    func addRandomColor() {
        let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        let newColor = Color(name: "", color: randomColor)
        colors.append(newColor)
    }
}
