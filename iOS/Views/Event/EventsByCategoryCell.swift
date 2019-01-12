//
//  EventCell.swift
//  iOS
//
//  Created by Felipe Mendes on 17/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class EventByCategoryCell: FeedCell {
    
    override func fetchEvents() {
        DispatchQueue.main.async {
            ApiService.sharedInstance.fetchEventsByCategory(uuid: (self.category?.uuid)!) { (events: [Event]) in
                self.events = events
                self.collectionView.reloadData()
            }
        }
    }
}
