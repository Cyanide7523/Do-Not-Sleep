//
//  TestInterfaceController.swift
//  Do not Sleep WatchKit Extension
//
//  Created by 이씨안 on 2018. 3. 8..
//  Copyright © 2018년 CyanProduction. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion
import HealthKit

class TestInterfaceController: WKInterfaceController {

    let manager = CMMotionManager()
    var timer:Timer!
    
    @IBOutlet var accelerometerLabel: WKInterfaceLabel!
    @IBOutlet var gyroLabel: WKInterfaceLabel!
    @IBOutlet var deviceMotionLabel: WKInterfaceLabel!
    @IBOutlet var magnetometerLabel: WKInterfaceLabel!
    @IBOutlet var heartbeatLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        manager.startAccelerometerUpdates()
        manager.startGyroUpdates()
        manager.startDeviceMotionUpdates()
        manager.startMagnetometerUpdates()
       
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(checkCoreMotion), userInfo: nil, repeats: true)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        timer.invalidate()
    }
    
    @objc func checkCoreMotion(){
        
        if manager.isAccelerometerAvailable{
            accelerometerLabel.setText("(\((manager.accelerometerData?.acceleration.x)!), \((manager.accelerometerData?.acceleration.y)!), \((manager.accelerometerData?.acceleration.z)!)")
        }else{
            accelerometerLabel.setText("Not avaliable")
        }
        if manager.isGyroAvailable{
            gyroLabel.setText("(\((manager.gyroData?.rotationRate.x)!), \((manager.gyroData?.rotationRate.y)!), \((manager.gyroData?.rotationRate.z)!))")
        }else{
            gyroLabel.setText("Not avaliable")
        }
        if manager.isDeviceMotionAvailable{
            deviceMotionLabel.setText("""
                Pitch : \((manager.deviceMotion?.attitude.pitch)!)
                Quaternion :\((manager.deviceMotion?.attitude.quaternion)!)
                Roll : \((manager.deviceMotion?.attitude.roll)!)
                """)
        }else{
            deviceMotionLabel.setText("Not avaliable")
        }
        if manager.isMagnetometerAvailable{
            magnetometerLabel.setText("""
                x : \((manager.magnetometerData?.magneticField.x)!)
                y : \((manager.magnetometerData?.magneticField.y)!)
                z : \((manager.magnetometerData?.magneticField.z)!)
                """)
        }else{
            magnetometerLabel.setText("Not avaliable")
        }
    }

}
