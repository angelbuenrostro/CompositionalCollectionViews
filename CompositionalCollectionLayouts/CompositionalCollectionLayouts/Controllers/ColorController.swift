//
//  ColorController.swift
//  CompositionalCollectionLayouts
//
//  Created by Angel Buenrostro on 3/29/20.
//  Copyright © 2020 Angel Buenrostro. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateDataSourceDelegate {
    func updateDataSource()
}

class ColorController {
    
    var colors: [Color] = [Color(name: "blue", color: UIColor.systemBlue), Color(name: "pink", color: UIColor.systemPink)]
    
    var delegate: UpdateDataSourceDelegate?
    
    func favorite(_ color: Color) {
        guard let colorIndex = colors.firstIndex(where: { $0 == color }) else { return }
        colors[colorIndex].favorite.toggle()
        
        guard let delegate = delegate else { fatalError("Could not favorite \(color.name)") }
        delegate.updateDataSource()
    }
}
