//
//  DetailInterfaceController.swift
//  purai-watchos Extension
//
//  Created by Felipe Mendes on 06/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import Foundation
import WatchKit

class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var eventName: WKInterfaceLabel!
    @IBOutlet weak var eventDate: WKInterfaceLabel!
    @IBOutlet weak var eventPrice: WKInterfaceLabel!
    @IBOutlet weak var eventPlace: WKInterfaceLabel!
    @IBOutlet weak var eventCity: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let event = context as? Event {
            eventName.setText(event.title)
            eventDate.setText(event.title)
            eventPrice.setText(event.price)
            eventPlace.setText(event.sale_place?.title)
            eventCity.setText(event.city)
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
}
