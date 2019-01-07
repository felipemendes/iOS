//
//  InterfaceController.swift
//  purai-watchos Extension
//
//  Created by Felipe Mendes on 06/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var interfaceTitle: WKInterfaceLabel!
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var events: [Event]?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.setTitle(localized("interface_title"))
        interfaceTitle.setText(localized("interface_info"))
        
        loadTableData()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func loadTableData() {
        
        fetchEvents()

        if let events = events {
            tableView.setNumberOfRows(2, withRowType: "RowController")
            
            for (index, rowModel) in events.enumerated() {
                if let rowController = self.tableView.rowController(at: index) as? RowController {
                    rowController.eventName.setText(rowModel.title)
                    rowController.eventDate.setText(rowModel.city)
                }
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        if let events = events {
            pushController(withName: "DetailInterfaceController", context: events[rowIndex])
        }
    }
    
    func fetchEvents() {
        ApiService.sharedInstance.fetchUpcomingEvents { (events) in
            self.events = events
        }
    }

}
