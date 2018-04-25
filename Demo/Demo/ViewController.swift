//
//  ViewController.swift
//  Demo
//
//  Created by GYJade on 2018/4/25.
//  Copyright © 2018年 com.yhy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//       test
        print(UInt32Value([Status.connected,Status.connected,Status.connecting,Status.connecting,Status.disconnect]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    enum Status: UInt32 {
        case disconnect = 0x1
        case connecting = 0x2
        case connected = 0x4
    }
    
    func UInt32Value(_ from:[Status]) -> UInt32 {
        
        var value: UInt32 = 0
        for statusItem in from {
            value |= statusItem.rawValue
        }
        return value
    }

}

