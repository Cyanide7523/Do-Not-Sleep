//
//  ViewController.swift
//  Do not Sleep
//
//  Created by 이씨안 on 2018. 3. 8..
//  Copyright © 2018년 CyanProduction. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, UINavigationControllerDelegate, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //<#code#>
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        //<#code#>
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        //<#code#>
    }
    

    @IBOutlet weak var sleepTimeLabel: UILabel!
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var guideLabelBackground: UIView!
    
    var sleepTime:Int?
    var isFirstTimeLaunched:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported(){
            let session = WCSession.default
            session.delegate = self
            session.activate()
            if session.isPaired == false {
                let alert:UIAlertController = UIAlertController(title: "Apple Watch가 연결되지 않았습니다.", message: "이 앱은 수면 추적을 위해 Apple Watch의 연결을 필수로 합니다. Apple Watch와 연결하고, 다시 실행해주세요.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            let alert:UIAlertController = UIAlertController(title: "Apple Watch를 사용할 수 없는 기기입니다.", message: "이 앱은 수면 추적을 위해, Apple Watch의 연결을 필수로 합니다. Apple Watch를 지원하는 기기를 사용해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: UIFont.systemFont(ofSize: 36, weight: .ultraLight).italic]
        
        guideLabelBackground.layer.cornerRadius = 12
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UIFont {
    var bold: UIFont {
        return with(traits: .traitBold)
    } // bold
    
    var italic: UIFont {
        return with(traits: .traitItalic)
    } // italic
    
    var boldItalic: UIFont {
        return with(traits: [.traitBold, .traitItalic])
    } // boldItalic
    
    
    func with(traits: UIFontDescriptorSymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        } // guard
        
        return UIFont(descriptor: descriptor, size: 0)
    } // with(traits:)
} // extension
