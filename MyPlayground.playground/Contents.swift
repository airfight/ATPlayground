//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

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
print(UInt32Value([Status.connected,Status.disconnect]))

