//
//  CategoryCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 01/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class CategoryCell: FeedCell {
    
    override func fetchEvents() {
        ApiService.sharedInstance.fetchCategoryEvents { (events) in
            self.events = events
            self.collectionView.reloadData()
        }
    }
}
