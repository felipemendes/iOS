//
//  UILabelExtension.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 25/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setTextStyle(size: CGFloat = 20, color: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: size, weight: .medium)
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }
}
