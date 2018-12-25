//
//  TodayCell.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 01/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class TodayCell: FeedCell {
    
    override func fetchEvents() {
        ApiService.sharedInstance.fetchTodayEvents { (events) in
            self.events = events
            self.collectionView.reloadData()
        }
    }
}
