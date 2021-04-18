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
    
    var swimTimeRatio:Double
    var bikeTimeRatio:Double
    var runTimeRatio: Double
    
    func calcSwimPace (time: TimeInterval) -> Double{
        return ((time / ((self.swimDistance*1000) / 100)) / 60)
    }
    
    func calculateBikePace(time: TimeInterval)-> Double {
        return ((self.bikeDistance*1000 )/time)
    }
    
    func calculateRunPace(time: TimeInterval) -> Double {
        return ((time/((self.runDistance*1000)/1000)) / 60)
    }
    
    mutating func swimFaster(){
        self.swimTimeRatio = self.swimTimeRatio - 0.01
        self.bikeTimeRatio = self.bikeTimeRatio + 0.005
        self.runTimeRatio = self.runTimeRatio + 0.005
    }
    
    mutating func swimSlower(){
        self.swimTimeRatio = self.swimTimeRatio + 0.01
        self.bikeTimeRatio = self.bikeTimeRatio - 0.005
        self.runTimeRatio = self.runTimeRatio - 0.005
    }
    
    mutating func bikeFaster(){
        self.swimTimeRatio = self.swimTimeRatio + 0.005
        self.bikeTimeRatio = self.bikeTimeRatio - 0.01
        self.runTimeRatio = self.runTimeRatio + 0.005
    }
    
    mutating func bikeSlower(){
        self.swimTimeRatio = self.swimTimeRatio - 0.005
        self.bikeTimeRatio = self.bikeTimeRatio + 0.01
        self.runTimeRatio = self.runTimeRatio - 0.005
    }
    
    mutating func runFaster(){
        self.swimTimeRatio = self.swimTimeRatio + 0.005
        self.bikeTimeRatio = self.bikeTimeRatio + 0.005
        self.runTimeRatio = self.runTimeRatio - 0.01
    }
    
    mutating func runSlower(){
        self.swimTimeRatio = self.swimTimeRatio - 0.005
        self.bikeTimeRatio = self.bikeTimeRatio - 0.005
        self.runTimeRatio = self.runTimeRatio + 0.01
    }
    
}
