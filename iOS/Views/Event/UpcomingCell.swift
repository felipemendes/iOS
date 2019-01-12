//
//  UpcomingCell.swift
//  iOS
//
//  Created by Felipe Mendes on 01/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class UpcomingCell: FeedCell {
    
    override func fetchEvents() {
        ApiService.sharedInstance.fetchUpcomingEvents { (events) in
            self.events = events
            self.collectionView.reloadData()
        }
    }
}
