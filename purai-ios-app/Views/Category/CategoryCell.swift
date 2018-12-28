//
//  CategoryCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 01/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class CategoryCell: BaseCategoryCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var baseController : BaseController?
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
            self.animate(for: self.collectionView)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        fetchCategories()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(BaseCategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        SpinnerController.sharedInstance.showSpinner()
        
        if !Reachability.isConnectedToNetwork(){
            self.collectionView.setEmptyMessage(localized("no_internet_connection"))
        } else if (self.categories?.count == nil) {
            self.collectionView.setEmptyMessage(localized("empty_view"))
        } else {
            SpinnerController.sharedInstance.removeSpinner()
            self.collectionView.restore()
        }
        
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! BaseCategoryCell
        cell.category = categories?[indexPath.item]
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
        self.baseController?.showCategoryListController(for: (categories?[indexPath.item])!)
    }
}
