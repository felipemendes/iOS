//
//  DetailController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 02/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var event: Event?
    
    let featuredImage = CustomImageView().setImageStyle()
    let titleLabel = UILabel().setLargeTextStyle()
    let descriptionLabel = UILabel().setNormalTextStyle()
    let priceLabel = UILabel().setNormalTextStyle()
    let addressLabel = UILabel().setNormalTextStyle()
    let salePlaceTitle = UILabel().setNormalTextStyle()
    let salePlacePhone = UILabel().setNormalTextStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .rgb(red: 7, green: 8, blue: 9)
        setupView()
    }
    
    func setupView() {
        setupBackgroundImage()
        
        titleLabel.text = event?.title
        descriptionLabel.text = event?.about
        priceLabel.text = event?.price
        addressLabel.text = event?.addressFormatted
        salePlaceTitle.text = event?.sale_place?.title
        salePlacePhone.text = event?.sale_place?.phone
        
        view.addSubview(featuredImage)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(addressLabel)
        view.addSubview(salePlaceTitle)
        view.addSubview(salePlacePhone)
        
        // horizontal constraints
        view.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: featuredImage)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: descriptionLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: priceLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: addressLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: salePlaceTitle)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: salePlacePhone)
        
        // vertical constraints
        view.addConstraintsWithFormat(format: "V:|-24-[v0]-20-[v1]-10-[v2]-10-[v3]-10-[v4]-10-[v5]-10-[v6]", views: featuredImage, titleLabel, descriptionLabel, priceLabel, addressLabel, salePlaceTitle, salePlacePhone)
        
//        featuredImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        featuredImage.heightAnchor.constraint(lessThanOrEqualToConstant: view.frame.height / 2).isActive = true
    }
    
    func setupBackgroundImage() {
        let backgroundImage = CustomImageView().setImageStyle()
        view.addSubview(backgroundImage)
        backgroundImage.addBlurEffect()
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}
