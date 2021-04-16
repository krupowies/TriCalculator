//
//  Triathlon.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 28/09/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import Foundation

struct Triathlon {
    let swimDistance:Double
    let bikeDistance:Double
    let runDistance:Double
    
    func calcSwimPace (time: TimeInterval) -> Double{
        return (time / (self.swimDistance / 100)) / 60
    }
    
    func calculateBikePace(time: TimeInterval)-> Double {
        return self.bikeDistance/time
    }
    
    func calculateRunPace(time: TimeInterval) -> Double {
        return (time/(self.runDistance/1000)) / 60
    }
    
    
}
