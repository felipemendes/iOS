//
//  Animator.swift
//  iOS
//
//  Created by Felipe Mendes on 29/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

final class Animator {
    private var hasAnimatedAllCells = false
    private let animation: Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UICollectionViewCell, at indexPath: IndexPath, in collectionView: UICollectionView) {
        guard !hasAnimatedAllCells else {
            return
        }
        
        animation(cell, indexPath, collectionView)
    }
}
