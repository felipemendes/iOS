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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: localized("back"), style: .plain, target: nil, action: nil)
        
        if !isLoggedIn() {
            perform(#selector(showWalkthroughController), with: nil, afterDelay: 0.01)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.changeStatusBar(background: .dark, tint: .white)
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    @objc func showWalkthroughController() {
        let loginController = WalkthroughController()
        present(loginController, animated: true, completion: nil)
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
