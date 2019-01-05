//
//  UserDefaults.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 05/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import UIKit

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
