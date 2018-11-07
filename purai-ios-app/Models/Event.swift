//
//  Event.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var id: NSNumber?
    var uuid: String?
    var status: NSNumber?
    var created_at: NSDate?
    var updated_at: NSDate?
    var title: String?
    var url_image: String?
    var date: NSDate?
    var address: String?
    var city: String?
    var id_category: NSNumber?
    var id_sale_place: NSNumber?
    var sale_place: SalePlace?
    var category: Category?
}

class SalePlace: NSObject {
    var id: NSNumber?
    var uuid: String?
    var status: NSNumber?
    var title: String?
    var phone: String?
}

class Category: NSObject {
    
    var id: NSNumber?
    var uuid: String?
    var status: NSNumber?
    var title: String?
    var category_image: String?
}
