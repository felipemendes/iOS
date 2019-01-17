//
//  Category.swift
//  iOS
//
//  Created by Felipe Mendes on 16/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

@objcMembers
class Category: NSObject {
    
    var id: NSNumber?
    var slug: String?
    var title: String?
    var about: String?
    var count: NSNumber?
    
    override init() {
        super.init()
    }
    
    init(dictionay: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionay)
    }
}
