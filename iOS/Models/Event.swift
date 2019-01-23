//
//  Event.swift
//  iOS
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

struct Event: Decodable {
    let id: Int?
    let guid: String?
    let slug: String?
    let status: String?
    let featured: String?
    let created_at: String?
    let updated_at: String?
    let title: String?
    let image: String?
    let about: String?
    let price: String?
    let date: String?
    let contact: String?
    let address: String?
    let city: String?
    let category: Category?
    let where_to_buy: WhereToBuy?
}
