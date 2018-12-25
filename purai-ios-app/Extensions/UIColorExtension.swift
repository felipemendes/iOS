//
//  UIColorExtension.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 25/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    @objc class var dark: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "dark")!
        } else {
            return UIColor(hexString: "#131921")!
        }
    }
    @objc class var gray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "gray")!
        } else {
            return UIColor(hexString: "#1A1A1A")!
        }
    }
    @objc class var lightGray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "lightGray")!
        } else {
            return UIColor(hexString: "#858585")!
        }
    }
    @objc class var highlight: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "highlight")!
        } else {
            return UIColor(hexString: "#6A66E7")!
        }
    }
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
