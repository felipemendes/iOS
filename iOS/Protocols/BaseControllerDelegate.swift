//
//  BaseControllerDelegate.swift
//  iOS
//
//  Created by Felipe Mendes on 06/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import UIKit

protocol BaseControllerDelegate: class {
    func showDetailController(for event: Event, at indexPath: IndexPath, of collectionView: UICollectionView)
    func showCategoryListController(for category: Category)
}
