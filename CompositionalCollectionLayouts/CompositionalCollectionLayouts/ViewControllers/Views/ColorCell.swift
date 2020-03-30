//
//  ColorCell.swift
//  CompositionalCollectionLayouts
//
//  Created by Angel Buenrostro on 3/29/20.
//  Copyright © 2020 Angel Buenrostro. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ColorCell"
    let label = UILabel()
    
    var swatch: ColorSwatch? {
        didSet {
            updateBackground()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ColorCell {
    func configure() {
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func updateBackground() {
        guard let color = swatch else { return }
        contentView.backgroundColor = color.color
        label.text = color.favorite ? "⭐️" : ""
    }
}
