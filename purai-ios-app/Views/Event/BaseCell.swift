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
        if let eventImageUrl = event?.image {
            eventImageView.loadImageUsingUrlString(urlString: eventImageUrl)
        }
    }

    let eventImageView = CustomImageView().setImageStyle(mode: .scaleAspectFill, clipsToBounds: true)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.dropShadow(color: .black, opacity: 1, offSet: CGSize.zero, radius: 0)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.dropShadow(color: .black, opacity: 1, offSet: CGSize.zero, radius: 0)
        return label
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(eventImageView)
        eventImageView.addSubview(titleLabel)
        eventImageView.addSubview(subtitleLabel)
        
        // horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: eventImageView)
        addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: subtitleLabel)
        
        // vertical constraints
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: eventImageView)
        addConstraintsWithFormat(format: "V:[v0]-5-[v1(20)]-30-|", views: titleLabel, subtitleLabel)
        
//        self.animate(for: eventImageView)
    }
}
