//
//  BaseController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 17/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit
import EasyTransitions

class BaseController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var modalTransitionDelegate = ModalTransitionDelegate()
    private var animatorInfo: AppStoreAnimatorInfo?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recalculateItemSizes(givenWidth: self.view.frame.size.width)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        recalculateItemSizes(givenWidth: size.width)
        
        coordinator.animate(alongsideTransition: nil) { (context) in
            if let animatorInfo = self.animatorInfo {
                if let cell = self.collectionView?.cellForItem(at: animatorInfo.index) {
                    let cellFrame = self.view.convert(cell.frame, from: self.collectionView)
                    animatorInfo.animator.initialFrame = cellFrame
                }
                else {
                    animatorInfo.animator.initialFrame = CGRect(x: (size.width-animatorInfo.animator.initialFrame.width)/2.0, y: size.height, width: animatorInfo.animator.initialFrame.width, height: animatorInfo.animator.initialFrame.height)
                }
            }
        }
    }
    
    func recalculateItemSizes(givenWidth width: CGFloat) {
        let vcWidth = width - 20
        var width: CGFloat = 355
        let colums = round(vcWidth / width)
        width = (vcWidth / colums) - 20
        (collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: width, height: 412)
    }
    
    func showCategoryListController(for category: Category) {
        let viewController = CategoryListController(collectionViewLayout: UICollectionViewFlowLayout())
        viewController.category = category
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showDetailController(for event: Event, at indexPath: IndexPath, of collectionView: UICollectionView) {
        let detailController = DetailController()
        detailController.event = event
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            present(detailController, animated: true, completion: nil)
            return
        }
        
        let cellFrame = view.convert(cell.frame, from: collectionView)
        
        let appStoreAnimator = AppStoreAnimator(initialFrame: cellFrame)
        appStoreAnimator.onReady = { cell.isHidden = true }
        appStoreAnimator.onDismissed = { cell.isHidden = false }
        
        modalTransitionDelegate.set(animator: appStoreAnimator, for: .present)
        modalTransitionDelegate.set(animator: appStoreAnimator, for: .dismiss)
        modalTransitionDelegate.wire(
            viewController: detailController,
            with: .regular(.fromTop),
            navigationAction: {
                detailController.dismiss(animated: true, completion: nil)
        })
        
        detailController.transitioningDelegate = modalTransitionDelegate
        detailController.modalPresentationStyle = .custom
        
        present(detailController, animated: true, completion: nil)
        animatorInfo = AppStoreAnimatorInfo(animator: appStoreAnimator, index: indexPath)
    }
}
