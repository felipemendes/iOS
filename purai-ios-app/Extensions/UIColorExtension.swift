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
            return UIColor(named: "dark") ?? .black
        } else {
            return .rgb(red: 19, green: 25, blue: 33)
        }
    }
    @objc class var gray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "gray") ?? .black
        } else {
            return .rgb(red: 26, green: 26, blue: 26)
        }
    }
    @objc class var lightGray: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "lightGray") ?? .black
        } else {
            return .rgb(red: 133, green: 133, blue: 133)
        }
    }
    @objc class var highlight: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "highlight") ?? .purple
        } else {
            return .rgb(red: 199, green: 82, blue: 200)
        }
    }
    
    public convenience init?(hexString: String) {
        let intensityR, intensityG, intensityB, opacity: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    intensityR = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    intensityG = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    intensityB = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    opacity = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: intensityR, green: intensityG, blue: intensityB, alpha: opacity)
                    return
                }
            }
        }
        
        return nil
    }
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
