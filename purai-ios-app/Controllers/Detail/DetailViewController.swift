//
//  DetailController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 02/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .dark
        return view
    }()
    
    var event: Event?
    
    let titleLabel = UILabel().setTextStyle(size: 22)
    let featuredImage = CustomImageView().setImageStyle()
    let backgroundImage = CustomImageView().setImageStyle(mode: .scaleAspectFill, radius: 0)
    
    // Description
    var descriptionView = UIView().setupBoxInfo()
    let descriptionLabel = UILabel().setTextStyle(size: 20)
    let descriptionValue = UILabel().setTextStyle(color: .lightGray)
    let descriptionIcon = CustomImageView().setImageStyle(mode: .scaleToFill ,radius: 0)
    
    // Price
    var priceView = UIView().setupBoxInfo()
    let priceLabel = UILabel().setTextStyle(size: 20)
    let priceValue = UILabel().setTextStyle(color: .lightGray)
    let priceIcon = CustomImageView().setImageStyle(mode: .scaleToFill ,radius: 0)
    
    // Address
    var addressView = UIView().setupBoxInfo()
    let addressLabel = UILabel().setTextStyle(size: 20)
    let addressValue = UILabel().setTextStyle(color: .lightGray)
    let addressIcon = CustomImageView().setImageStyle(mode: .scaleToFill ,radius: 0)
    
    // Sale Place
    var salePlaceView = UIView().setupBoxInfo()
    let salePlaceLabel = UILabel().setTextStyle(size: 20)
    let salePlaceValue = UILabel().setTextStyle(color: .lightGray)
    let salePlaceIcon = CustomImageView().setImageStyle(mode: .scaleToFill ,radius: 0)
    
    // Sale Place Phone
    var salePlacePhoneView = UIView().setupBoxInfo()
    let salePlacePhoneLabel = UILabel().setTextStyle(size: 20)
    let salePlacePhoneValue = UILabel().setTextStyle(color: .lightGray)
    let salePlacePhoneIcon = CustomImageView().setImageStyle(mode: .scaleToFill ,radius: 0)
    
    let dismissButton: UIButton = {
        let btn: UIButton = UIButton()
        btn.setImage(UIImage(named: "dismiss"), for: .normal)
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = event?.title
        self.navigationController?.navigationBar.backgroundColor = .dark
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.isTranslucent = true
        }
        
        view.addSubview(scrollView)
        
        setupValues()
        setupView()
        setupNavBarButtons()
    }
    
    func setupValues() {
        titleLabel.text = event?.title
        descriptionValue.text = event?.about
        priceValue.text = event?.price
        addressValue.text = event?.addressFormatted
        salePlaceValue.text = event?.sale_place?.title
        salePlacePhoneValue.text = event?.sale_place?.phone
        
        if let eventImageUrl = event?.image {
            featuredImage.loadImageUsingUrlString(urlString: eventImageUrl)
            backgroundImage.loadImageUsingUrlString(urlString: eventImageUrl)
        }
    }
    
    func setupView() {
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

//        setupBackgroundImage()
        setupFeaturedImage()
        
        setupBox(for: localized("description"), label: descriptionLabel, value: descriptionValue, icon: descriptionIcon, iconName: "info", box: descriptionView)
        setupBox(for: localized("price"), label: priceLabel, value: priceValue, icon: priceIcon, iconName: "price", box: priceView)
        setupBox(for: localized("address"), label: addressLabel, value: addressValue, icon: addressIcon, iconName: "address", box: addressView)
        setupBox(for: localized("sale_place"), label: salePlaceLabel, value: salePlaceValue, icon: salePlaceIcon, iconName: "sale_place", box: salePlaceView)
        setupBox(for: localized("phone"), label: salePlacePhoneLabel, value: salePlacePhoneValue, icon: salePlacePhoneIcon, iconName: "phone", box: salePlacePhoneView)
        
        scrollView.addConstraintsWithFormat(format: "V:|-24-[v0]-16-[v1]-16-[v2]-16-[v3]-16-[v4]-16-[v5]", views: featuredImage, descriptionView, priceView, addressView, salePlaceView, salePlacePhoneView)
        
        DispatchQueue.main.async {
            let viewHeight = self.featuredImage.frame.height + self.descriptionView.frame.height + self.priceView.frame.height + self.addressView.frame.height + self.salePlaceView.frame.height + self.salePlacePhoneView.frame.height + 16 + 16 + 76
            self.scrollView.contentSize.height = viewHeight
        }
    }
    
    func setupFeaturedImage() {
        scrollView.addSubview(featuredImage)
        scrollView.animate(for: featuredImage)
        featuredImage.heightAnchor.constraint(lessThanOrEqualToConstant: view.frame.height / 2).isActive = true
        featuredImage.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
    
    func setupBackgroundImage() {
        scrollView.addSubview(backgroundImage)
        backgroundImage.addBlurEffect()
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}

extension DetailViewController {
    func setupBox(for name: String, label: UILabel, value: UILabel, icon: CustomImageView, iconName: String, box: UIView) {
        label.text = name
        icon.image = UIImage(named: iconName)
        
        scrollView.addSubview(box)
        scrollView.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: box)
        
        scrollView.animate(for: box)
        
        NSLayoutConstraint(item: box, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0).isActive = true
        
        box.addSubview(icon)
        box.addSubview(label)
        box.addSubview(value)
        
        scrollView.addConstraintsWithFormat(format: "H:|-16-[v0(25)]-16-[v1]-16-|", views: icon, label)
        scrollView.addConstraintsWithFormat(format: "V:|-16-[v0(25)]", views: icon)
        
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: icon, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: value, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: value, attribute: .left, relatedBy: .equal, toItem: label, attribute: .left, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: value, attribute: .right, relatedBy: .equal, toItem: label, attribute: .right, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 25.0).isActive = true
        box.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
    }
    
    func setupNavBarButtons() {
        let shareImage = UIImage(named: "share")?.withRenderingMode(.alwaysOriginal)
        let shareBarButtonItem = UIBarButtonItem(image: shareImage, style: .plain, target: self, action: #selector(handleShare))
        
        navigationItem.rightBarButtonItems = [shareBarButtonItem]
    }
    
    @objc func dismiss(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleShare() {
        let view = UIActivityViewController(activityItems: [localized("share_message")], applicationActivities: nil)
        view.popoverPresentationController?.sourceView = self.view
        self.present(view, animated: true, completion: nil)
    }
}
