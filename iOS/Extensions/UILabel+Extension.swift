//
//  UILabelExtension.swift
//  iOS
//
//  Created by Felipe Mendes on 25/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setTextStyle(size: CGFloat = 16, color: UIColor = .white, weight: UIFont.Weight = .medium) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }
}
