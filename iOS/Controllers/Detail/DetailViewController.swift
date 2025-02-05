//
//  DetailController.swift
//  iOS
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
    
    let featuredImage = CustomImageView().setImageStyle(mode: .scaleAspectFill, radius: 0)
    let backgroundImage = CustomImageView().setImageStyle(mode: .scaleAspectFill, radius: 0)
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .dark
        view.layer.cornerRadius = 12
        return view
    }()
    
    var boxHeight: CGFloat = 0.0
    
    // Description
    var descriptionView = UIView().setupBoxInfo()
    let descriptionLabel = UILabel().setTextStyle(size: 14, color: .highlight, weight: .semibold)
    let descriptionValue = UILabel().setTextStyle()
    let descriptionIcon = CustomImageView().setImageStyle(mode: .scaleToFill, radius: 0)
    
    // Date
    var dateView = UIView().setupBoxInfo()
    let dateLabel = UILabel().setTextStyle(size: 14, color: .highlight, weight: .semibold)
    let dateValue = UILabel().setTextStyle()
    let dateIcon = CustomImageView().setImageStyle(mode: .scaleToFill, radius: 0)
    
    // Price
    var priceView = UIView().setupBoxInfo()
    let priceLabel = UILabel().setTextStyle(size: 14, color: .highlight, weight: .semibold)
    let priceValue = UILabel().setTextStyle()
    let priceIcon = CustomImageView().setImageStyle(mode: .scaleToFill, radius: 0)
    
    // Address
    var addressView = UIView().setupBoxInfo()
    let addressLabel = UILabel().setTextStyle(size: 14, color: .highlight, weight: .semibold)
    let addressValue = UILabel().setTextStyle()
    let addressIcon = CustomImageView().setImageStyle(mode: .scaleToFill, radius: 0)
    
    // Where To Buy
    var whereToBuyView = UIView().setupBoxInfo()
    let whereToBuyLabel = UILabel().setTextStyle(size: 14, color: .highlight, weight: .semibold)
    let whereToBuyValue = UILabel().setTextStyle()
    let whereToBuyIcon = CustomImageView().setImageStyle(mode: .scaleToFill, radius: 0)
    
    // Contact
    var contactView = UIView().setupBoxInfo()
    let contactLabel = UILabel().setTextStyle(size: 14, color: .highlight, weight: .semibold)
    let contactValue = UILabel().setTextStyle()
    let contactIcon = CustomImageView().setImageStyle(mode: .scaleToFill, radius: 0)
    
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
        descriptionValue.text = event?.about
        dateValue.text = event?.date
        priceValue.text = event?.price
        addressValue.text = "" // event?.addressFormatted
        whereToBuyValue.text = event?.where_to_buy?.title
        contactValue.text = event?.contact
        
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
        setupBox(for: localized("date"), label: dateLabel, value: dateValue, icon: dateIcon, iconName: "date", box: dateView)
        setupBox(for: localized("price"), label: priceLabel, value: priceValue, icon: priceIcon, iconName: "price", box: priceView)
        setupBox(for: localized("address"), label: addressLabel, value: addressValue, icon: addressIcon, iconName: "address", box: addressView)
        setupBox(for: localized("where_to_buy"), label: whereToBuyLabel, value: whereToBuyValue, icon: whereToBuyIcon, iconName: "where_to_buy", box: whereToBuyView)
        setupBox(for: localized("phone"), label: contactLabel, value: contactValue, icon: contactIcon, iconName: "phone", box: contactView)
        
        scrollView.addSubview(backgroundView)
        scrollView.addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: backgroundView)
        scrollView.addConstraintsWithFormat(format: "V:|[v0]-30-[v1]", views: featuredImage, backgroundView)
        backgroundView.addConstraintsWithFormat(format: "V:|[v0]-[v1]-[v2]-[v3]-[v4]-[v5]", views: descriptionView, dateView, priceView, addressView, whereToBuyView, contactView)
        backgroundView.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        
        DispatchQueue.main.async {
            let boxInfoHeight: CGFloat = self.boxHeight + self.featuredImage.frame.height
            let viewHeight = self.featuredImage.frame.height + boxInfoHeight
            self.backgroundView.heightAnchor.constraint(equalToConstant: boxInfoHeight).isActive = true
            self.scrollView.contentSize.height = viewHeight
        }
    }
    
    func setupFeaturedImage() {
        scrollView.addSubview(featuredImage)
        featuredImage.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
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
        
        icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = .highlight
        
        backgroundView.addSubview(box)
        backgroundView.addConstraintsWithFormat(format: "H:|[v0]|", views: box)
        
        DispatchQueue.main.async {
            let viewHeight = label.frame.height + value.frame.height
            self.boxHeight += viewHeight
            NSLayoutConstraint(item: box, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: viewHeight + 16).isActive = true
        }
        
        box.addSubview(icon)
        box.addSubview(label)
        box.addSubview(value)
        
        box.addConstraintsWithFormat(format: "H:|-20-[v0(20)]-12-[v1]-20-|", views: icon, label)
        box.addConstraintsWithFormat(format: "V:|-28-[v0(20)]", views: icon)
        
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: icon, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: value, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1.0, constant: 4.0).isActive = true
        NSLayoutConstraint(item: value, attribute: .left, relatedBy: .equal, toItem: label, attribute: .left, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: value, attribute: .right, relatedBy: .equal, toItem: label, attribute: .right, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0).isActive = true
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
