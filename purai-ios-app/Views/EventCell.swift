//
//  EventCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "sample-event")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sample-event")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sample Event"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 96/255, green: 97/255, blue: 100/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cupertino"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 96/255, green: 97/255, blue: 100/255, alpha: 1)
        return view
    }()
    
    func setupViews() {
        addSubview(eventImageView)
        addSubview(separatorView)
        addSubview(categoryImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: eventImageView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: categoryImageView)
        
        // vertical constraints
        //        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1]-4-[v2]-[v3(1)]|", views: eventImageView, titleLabel, subtitleLabel, separatorView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: eventImageView, categoryImageView, separatorView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // titleLabel - top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: eventImageView, attribute: .bottom, multiplier: 1, constant: 8))
        // titleLabel - left constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: categoryImageView, attribute: .right, multiplier: 1, constant: 8))
        // titleLabel - right constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: eventImageView, attribute: .right, multiplier: 1, constant: 0))
        // titleLabel - height constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
        
        // subtitleTextView - top constraint
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        // subtitleTextView - left constraints
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .left, relatedBy: .equal, toItem: categoryImageView, attribute: .right, multiplier: 1, constant: 8))
        // subtitleTextView - right constraints
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        // subtitleTextView - height constraints
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
