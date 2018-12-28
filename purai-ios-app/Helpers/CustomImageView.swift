//
//  CustomImageView.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 25/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
            
            }.resume()
    }
}

extension CustomImageView {
    
    func setImageStyle(mode: UIView.ContentMode = .scaleAspectFill, radius: CGFloat = 12, clipsToBounds: Bool = false) -> CustomImageView {
        let imageView = CustomImageView()
        imageView.contentMode = mode
        imageView.clipsToBounds = clipsToBounds
        imageView.layer.cornerRadius = radius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

