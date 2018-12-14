//
//  DetailController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 02/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    var event: Event?
    
    let backgroundImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "awesome-event")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let featuredImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "awesome-event")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.dropShadow(color: .black, opacity: 0.8, offSet: CGSize.init(width: -1, height: 2), radius: 2)
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.dropShadow(color: .black, opacity: 1, offSet: CGSize.zero, radius: 5)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.dropShadow(color: .black, opacity: 1, offSet: CGSize.zero, radius: 5)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .rgb(red: 7, green: 8, blue: 9)
        setupView()
    }
    
    func setupView() {
        titleLabel.text = event?.title
        setupBackgroundImage()
        
        view.addSubview(titleLabel)
        view.addSubview(featuredImage)
        
        // horizontal constraints
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: featuredImage)
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: titleLabel)
        
        // vertical constraints
        view.addConstraintsWithFormat(format: "V:|[v0]-20-[v1(40)]", views: featuredImage, titleLabel)
        
        featuredImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        featuredImage.heightAnchor.constraint(lessThanOrEqualToConstant: view.frame.height / 2).isActive = true
    }
    
    func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.addBlurEffect()
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}
