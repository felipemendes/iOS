//
//  DetailInterfaceController.swift
//  watchOS Extension
//
//  Created by Felipe Mendes on 06/01/19.
//  Copyright © 2019 Felipe Mendes. All rights reserved.
//

import Foundation
import WatchKit

class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var eventImage: WKInterfaceImage!
    @IBOutlet weak var eventName: WKInterfaceLabel!
    @IBOutlet weak var eventDate: WKInterfaceLabel!
    @IBOutlet weak var eventPrice: WKInterfaceLabel!
    @IBOutlet weak var eventPlace: WKInterfaceLabel!
    @IBOutlet weak var eventCity: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let event = context as? Event {
            
            if let image = event.image {
                eventImage.imageFromUrl(image)
            }
            
            eventName.setText(event.title)
            eventDate.setText(event.title)
            eventPrice.setText(event.price)
            eventPlace.setText(event.sale_place?.title)
            eventCity.setText(event.city)
        }
    }
}

extension WKInterfaceImage {
    public func imageFromUrl(_ urlString: String) {
        
        if let url = NSURL(string: urlString) {
            
            let request = NSURLRequest(url: url as URL)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, _, _) in
                if let imageData = data as Data? {
                    DispatchQueue.main.async {
                        self.setImageData(imageData)
                    }
                }
            })
            
            task.resume()
        }
    }
}
