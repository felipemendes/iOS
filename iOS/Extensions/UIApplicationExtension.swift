//
//  UIApplicationExtension.swift
//  iOS
//
//  Created by Felipe Mendes on 25/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
