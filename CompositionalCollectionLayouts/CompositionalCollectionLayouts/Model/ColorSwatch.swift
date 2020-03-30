//
//  Color.swift
//  CompositionalCollectionLayouts
//
//  Created by Angel Buenrostro on 3/29/20.
//  Copyright © 2020 Angel Buenrostro. All rights reserved.
//

import Foundation
import UIKit

struct ColorSwatch: Hashable {
    let name: String
    let color: UIColor
    var favorite: Bool
    
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: ColorSwatch, rhs: ColorSwatch) -> Bool {
        return (lhs.identifier == rhs.identifier && lhs.favorite == rhs.favorite)
    }
    
    init(name: String, color: UIColor, favorite: Bool = false) {
        self.name = name
        self.color = color
        self.favorite = favorite
    }
    
    init(oldColor: ColorSwatch) {
        self.name = oldColor.name
        self.color = oldColor.color
        self.favorite = oldColor.favorite
    }
}
