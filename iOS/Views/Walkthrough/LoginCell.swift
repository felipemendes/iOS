//
//  LoginCell.swift
//  iOS
//
//  Created by Felipe Mendes on 05/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "sample1")
        image.clipsToBounds = true
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(localized("login"), for: .normal)
        button.setTitleColor(.highlight, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: WalkthroughControllerDelegate?
    
    @objc func handleLogin() {
        delegate?.finishLoggingIn()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(loginButton)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        loginButton.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        loginButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
