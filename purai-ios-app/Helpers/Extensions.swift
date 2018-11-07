//
//  Extensions.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
        if error != nil {
            print(error!)
            return
        }
        
        DispatchQueue.main.async {
            self.image = UIImage(data: data!)
        }
        
        }.resume()
    }
}
