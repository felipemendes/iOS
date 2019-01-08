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
    
    private var events = [Event]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.setTitle(localized("interface_title"))
        interfaceTitle.setText(localized("interface_info"))
        
        loadTableData()
    }
    
    private func loadTableData() {
        
        ApiService.sharedInstance.fetchUpcomingEvents { (events) in
            
            self.tableView.setNumberOfRows(events.count, withRowType: "RowController")
            
            for (index, rowModel) in events.enumerated() {
                
                self.events.append(rowModel)
                
                if let rowController = self.tableView.rowController(at: index) as? RowController {
                    rowController.eventName.setText(rowModel.title)
                    rowController.eventDate.setText(rowModel.city)
                }
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        presentController(withName: "DetailInterfaceController", context: events[rowIndex])
    }
}
