//
//  ViewController.swift
//  Demo
//
//  Created by GYJade on 2018/4/25.
//  Copyright © 2018年 com.yhy. All rights reserved.
//

import UIKit

let DefaultAPIScheduleQueue = DispatchQueue(label: "com.gy.APIScheduleQueue", attributes: [])


class ViewController: UIViewController {

    open var apiScheduleQueue: DispatchQueue {
        get {
            return DefaultAPIScheduleQueue
        }
    }
    
    var stepSize = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        increment(&stepSize)
        
        apiScheduleQueue.sync {
            
            print(6)
            print(Thread.current)
            apiScheduleQueue.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                print(5)
                print(Thread.current)
            })
            sleep(3)
            
        }
        
        apiScheduleQueue.sync {
            
            print(66)
            apiScheduleQueue.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                print(55)
                print(Thread.current)

            })
            sleep(3)
            
        }
        
        apiScheduleQueue.sync {
            print(666)
            print(Thread.current)
            apiScheduleQueue.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                print(555)
                print(Thread.current)

            })
            sleep(3)
        }

       
//        Sync.customQueue(apiScheduleQueue, task:  DispatchWorkItem {
//
//            print(5)
//
//            self.apiScheduleQueue.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
//                print(15)
//            })
//
//            print(6)
//        })
//
//        Sync.customQueue(apiScheduleQueue, task:  DispatchWorkItem {
//
//            print(7)
//
//            self.apiScheduleQueue.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
//                print(16)
//            })
//
//            print(8)
//        })
//
//        print(UInt32Value([Status.connected,Status.connected,Status.connecting,Status.connecting,Status.disconnect]))
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
    
    
    /// 内存访问冲突
    ///
    /// - Parameter number: <#number description#>
    func increment(_ number: inout Int) {
        
        number += stepSize
    }

}

