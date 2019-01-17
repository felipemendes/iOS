//
//  CategoryCell.swift
//  iOS
//
//  Created by Felipe Mendes on 01/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class CategoryCell: BaseCategoryCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: BaseControllerDelegate?
    var categories: [Category]?
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .dark
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func fetchCategories() {
        ApiServiceCategory.sharedCategoryInstance.fetchCategories { (categories: [Category]) in
            self.categories = categories
            self.collectionView.reloadData()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(BaseCategoryCell.self, forCellWithReuseIdentifier: cellId)
        
        NetworkManager.isReachable { _ in
            self.fetchCategories()
        }
        
        NetworkManager.isUnreachable { _ in
            self.collectionView.setEmptyMessage(localized("no_internet_connection"))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! BaseCategoryCell
        cell.category = categories?[indexPath.item]
        
        let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: collectionView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: (height + 16 + 76) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.showCategoryListController(for: (categories?[indexPath.item])!)
    }
}
