//
//  Category.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 16/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

@objcMembers
class Category: NSObject {
    
    var id: NSNumber?
    var uuid: String?
    var status: NSNumber?
    var title: String?
    var category_image: String?
    
    override init() {
        super.init()
    }
    
    init(dictionay: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionay)
    }
}
