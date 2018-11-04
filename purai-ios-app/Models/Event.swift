//
//  Event.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var url_image: String?
    var title: String?
    var city: String?
    var category: Category?
}

class Category: NSObject {
    
    var url_image: String?
    var title: String?
}
