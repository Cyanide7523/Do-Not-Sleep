//
//  InterfaceController.swift
//  Do not Sleep WatchKit Extension
//
//  Created by 이씨안 on 2018. 3. 8..
//  Copyright © 2018년 CyanProduction. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var sleepTimeLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func didSelectDetailButton() {
        self.pushController(withName: "DetailInterfaceController", context: nil)
    }
    
}
