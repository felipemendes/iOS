//
//  SpinnerController.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 30/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class SpinnerController: NSObject {
    
    static let sharedInstance = SpinnerController()
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    
    //MARK: Public Methods
    func showSpinner() {
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let holdingView = appDel.window!.rootViewController!.view!
        
        DispatchQueue.main.async {
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.center = holdingView.center
            self.activityIndicator.color = .white
            holdingView.addSubview(self.activityIndicator)
            holdingView.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func removeSpinner(){
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}
