//
//  TodayViewController.swift
//  Today Extension
//
//  Created by Felipe Mendes on 11/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayTableViewController: UITableViewController, NCWidgetProviding {
    
    private var upcomingEvents = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func fetchEvents() {
        ApiService.sharedInstance.fetchUpcomingEvents { (events) in
            for row in events {
                self.upcomingEvents.append(row)
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodayTableViewCell

        if upcomingEvents.count > 0 {
            let event = upcomingEvents[indexPath.item]
            cell.prepare(with: event)
        }
        
        return cell
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        self.fetchEvents()
        completionHandler(NCUpdateResult.newData)
    }
}
