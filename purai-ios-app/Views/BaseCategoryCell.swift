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
            setupCategoryImage()
            
            if let title = category?.title {
                let size = CGSize(width: frame.width - 16 - 40 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimateRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimateRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 35
                } else {
                    titleLabelHeightConstraint?.constant = 15
                }
            }
        }
    }
    
    func setupCategoryImage() {
        if let categoryImageUrl = category?.category_image {
            categoryImageView.loadImageUsingUrlString(urlString: categoryImageUrl)
        }
    }
    
    let categoryImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.dropShadow(color: .black, opacity: 1, offSet: CGSize.zero, radius: 5)
        return label
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(categoryImageView)
        addSubview(titleLabel)
        
        // horizontal constraints
        addConstraintsWithFormat(format: "H:|-5-[v0]-5-|", views: categoryImageView)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: titleLabel)
        
        // vertical constraints
        addConstraintsWithFormat(format: "V:|-5-[v0]-5-|", views: categoryImageView)
        addConstraintsWithFormat(format: "V:|-20-[v0]", views: titleLabel)
    }
}
