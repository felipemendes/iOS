//
//  DetailController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 02/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class DetailController: UIViewController{

    var event: Event?
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "awesome-event")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = .rgb(red: 7, green: 8, blue: 9)
        self.navigationItem.title = event?.title
        
        setupView()
    }
    
    func setupView() {
        
        view.addSubview(backgroundImage)
        
        backgroundImage.addBlurEffect()
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
    }
}
