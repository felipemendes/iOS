//
//  BaseController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 17/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class BaseController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .highlight
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .dark
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.barTintColor = .dark
        navigationController?.navigationBar.barStyle = .black
    }
    
    func showCategoryListController(for category: Category) {
        let viewController = CategoryListController(collectionViewLayout: UICollectionViewFlowLayout())
        viewController.category = category
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showDetailController(for event: Event, at indexPath: IndexPath, of collectionView: UICollectionView) {
        let viewController = DetailViewController()
        viewController.event = event
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
