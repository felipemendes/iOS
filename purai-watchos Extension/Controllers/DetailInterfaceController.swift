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
    
    var context: Event? {
        didSet {
            eventName.setText(context?.title)
            eventDate.setText(context?.title)
            eventPrice.setText(context?.price)
            eventPlace.setText(context?.sale_place?.title)
            eventCity.setText(context?.city)
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
//        if let event = context as? String {
//            eventName.setText(event)
//        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
}
