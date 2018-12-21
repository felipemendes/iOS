//
//  BaseCategoryCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 16/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class BaseCategoryCell: BaseCell {
    
    var category: Category? {
        didSet {
            titleLabel.text = category?.title
            
            if let title = category?.title {
                let size = CGSize(width: frame.width - 16 - 40 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimateRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 14)!], context: nil)
                
                if estimateRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 35
                } else {
                    titleLabelHeightConstraint?.constant = 15
                }
            }
        }
    }
    
    let background: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .gray
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        label.adjustsFontSizeToFitWidth = true
        label.dropShadow(color: .black, opacity: 1, offSet: CGSize.zero, radius: 5)
        return label
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(background)
        addSubview(titleLabel)
        
        // horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: background)
        addConstraintsWithFormat(format: "H:|-28-[v0]-28-|", views: titleLabel)
        
        // vertical constraints
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-|", views: background)
        addConstraintsWithFormat(format: "V:|[v0]|", views: titleLabel)
    }
}
