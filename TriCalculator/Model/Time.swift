//
//  Time.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 23/04/2021.
//  Copyright © 2021 Wojtek Krupowies. All rights reserved.
//

import Foundation

struct Time {
    
    var hours:Int
    var minutes: Int
    var seconds: Int
    
    init() {
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    init(hours: Int, minutes: Int, seconds: Int) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    public func format(totalTime: Double) -> Time{
        var hours = 0.0
        var minutes = 0.0
        var seconds = 0.0
        let temp = totalTime/3600
        hours = temp.rounded(.towardZero)
        minutes = temp.truncatingRemainder(dividingBy: 1)*60
        seconds = minutes.truncatingRemainder(dividingBy: 1)*60
        minutes = minutes.rounded(.towardZero)
        seconds = seconds.rounded(.towardZero)
        
        
        let time = Time(hours: Int(hours), minutes: Int(minutes), seconds: Int(seconds))
        
        return time
    }
}
