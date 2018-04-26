//
//  Sync.swift
//  Demo
//
//  Created by ZGY on 2018/4/26.
//Copyright © 2018年 com.yhy. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2018/4/26  下午5:29
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import Foundation

public struct Sync {
    
    /**
     unsafe
     
     - parameter task: 执行的任务
     */
    public static func customQueue(_ queue: DispatchQueue, task: DispatchWorkItem?) -> Void {
        if let call = task {
            queue.sync(execute: call)
        }
    }
    
}
