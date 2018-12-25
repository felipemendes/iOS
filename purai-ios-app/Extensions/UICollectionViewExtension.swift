//
//  UICollectionViewExtension.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 25/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
