//
//  EventCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class EventCell: BaseCell {
    
    var event: Event? {
        didSet {
            titleLabel.text = event?.title
            
            setupEventImage()
            
            subtitleLabel.text = event?.city
            
            setupCategoryImage()
            
            // Measure title text
            if let title = event?.title {
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
    
    func setupEventImage() {
        if let eventImageUrl = event?.url_image {
            eventImageView.loadImageUsingUrlString(urlString: eventImageUrl)
        }
    }
    
    func setupCategoryImage() {
        if let categoryImageUrl = event?.category?.category_image {
            categoryImageView.loadImageUsingUrlString(urlString: categoryImageUrl)
        }
    }
    
    let eventImageView: CustomImageView = {
        let imageView = CustomImageView()
//        imageView.image = UIImage.init(named: "sample-event")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let categoryImageView: CustomImageView = {
        let imageView = CustomImageView()
//        imageView.image = UIImage(named: "sample-event")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Sample Event"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .rgb(red: 96, green: 97, blue: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Cupertino"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(eventImageView)
        addSubview(categoryImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: eventImageView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(40)]", views: categoryImageView)
        
        // vertical constraints
        addConstraintsWithFormat(format: "V:|-8-[v0]-12-[v1(40)]-24-|", views: eventImageView, categoryImageView)
        
        // titleLabel - top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: eventImageView, attribute: .bottom, multiplier: 1, constant: 8))
        // titleLabel - left constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: categoryImageView, attribute: .right, multiplier: 1, constant: 12))
        // titleLabel - right constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: eventImageView, attribute: .right, multiplier: 1, constant: 0))
        // titleLabel - height constraints
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15)
        addConstraint(titleLabelHeightConstraint!)
        
        // subtitleTextView - top constraint
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 3))
        // subtitleTextView - left constraints
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .left, relatedBy: .equal, toItem: categoryImageView, attribute: .right, multiplier: 1, constant: 12))
        // subtitleTextView - right constraints
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        // subtitleTextView - height constraints
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
    }
}
