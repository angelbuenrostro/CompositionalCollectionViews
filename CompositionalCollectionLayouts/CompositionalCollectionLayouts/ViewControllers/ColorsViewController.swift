//
//  ColorsViewController.swift
//  CompositionalCollectionLayouts
//
//  Created by Angel Buenrostro on 3/29/20.
//  Copyright © 2020 Angel Buenrostro. All rights reserved.
//

import UIKit

enum Section {
    case main
}

class ColorsViewController: UIViewController {
    
    
    let colorController = ColorController()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Color>!
    var collectionView: UICollectionView! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorController.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Colors"
        configureHierarchy()
        configureDataSource()
        
    }

}

extension ColorsViewController {
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.reuseIdentifier)
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { ( sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            let spacing = CGFloat(10)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(spacing)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = spacing
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            return section
        }
        
        return layout
    }
    
    private func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Color>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Color) -> UICollectionViewCell? in
            
            // Get a cell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.reuseIdentifier, for: indexPath) as? ColorCell else { fatalError("Cannot create new cell")}
            
            // Populate the cell
            let color = self.dataSource.itemIdentifier(for: indexPath)
            cell.color = color
            
            return cell
        }
        
        // initial data
        updateDataSource()
    }
}

extension ColorsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ColorCell else { fatalError("Could not instantiate Color Cell")}
        guard var color = dataSource.itemIdentifier(for: indexPath) else { return }
        print("Favorited: \(color.name)")
        colorController.favorite(color)
        color.favorite.toggle()
        cell.color = color
    }
}

extension ColorsViewController: UpdateDataSourceDelegate {
    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Color>()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(colorController.colors)
        dataSource.apply(snapshot, animatingDifferences: true)
        print(colorController.colors)
    }
}
