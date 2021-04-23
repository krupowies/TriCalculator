//
//  TriOutputViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 07/10/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit

class TriOutputViewController: UIViewController {
    
    
    @IBOutlet weak var hoursSwimTime: UILabel!
    @IBOutlet weak var minutesSwimTime: UILabel!
    @IBOutlet weak var secondsSwimTime: UILabel!
    
    @IBOutlet weak var traithlonSwimPace: UILabel!
    
    @IBOutlet weak var hoursBikeTime: UILabel!
    @IBOutlet weak var minutesBikeTime: UILabel!
    @IBOutlet weak var secondsBikeTime: UILabel!
    
    @IBOutlet weak var traithlonBikePace: UILabel!
    
    @IBOutlet weak var hoursRunTime: UILabel!
    @IBOutlet weak var minutesRunTime: UILabel!
    @IBOutlet weak var secondsRunTime: UILabel!
    
    @IBOutlet weak var triathlonRunPace: UILabel!
    
    
    var totalTime = 0.0
    var currentTriathlon = Triathlon(swimDistance: 0.0, bikeDistance: 0.0, runDistance: 0.0, swimTimeRatio: 0.0, bikeTimeRatio: 0.0, runTimeRatio: 0.0)
    
    var currentSwimPace: Double = 0.0
    var currentBikePace: Double = 0.0
    var currentRunPace: Double = 0.0
    
    var swimtActiveTime = Time()
    var biketActiveTime = Time()
    var runtActiveTime = Time()
    

    @IBAction func fasterSwimButtonTap(_ sender: Any) {
        currentTriathlon.swimFaster()
        calculateTriathlonPace()
        showActiveTime()
    }
    
    @IBAction func slowerSwimButtonTap(_ sender: Any) {
        currentTriathlon.swimSlower()
        calculateTriathlonPace()
        showActiveTime()
    }
    
    @IBAction func fasterBikeButtonTap(_ sender: Any) {
        currentTriathlon.bikeFaster()
        calculateTriathlonPace()
        showActiveTime()
    }
    
    @IBAction func slowerBikeButtonTap(_ sender: Any) {
        currentTriathlon.bikeSlower()
        calculateTriathlonPace()
        showActiveTime()
    }
    

    @IBAction func fasterRunButtonTap(_ sender: Any) {
        currentTriathlon.runFaster()
        calculateTriathlonPace()
        showActiveTime()
    }
    
    @IBAction func slowerRunButtonTap(_ sender: Any) {
        currentTriathlon.runSlower()
        calculateTriathlonPace()
        showActiveTime()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(totalTime)
        print(currentTriathlon)
        
        calculateTriathlonPace()
        showActiveTime()
    }
    
    func calcTriathlonSwim() ->Double {
        let swimTime = totalTime * currentTriathlon.swimTimeRatio
        return currentTriathlon.calcSwimPace(time: swimTime)
    }
    
    func calcTriathlonBike() -> Double {
        let bikeTime = totalTime * currentTriathlon.bikeTimeRatio
        return currentTriathlon.calculateBikePace(time: bikeTime)
    }
    
    func calcTriathlonRun() -> Double {
        let runTime = totalTime * currentTriathlon.runTimeRatio
        return currentTriathlon.calculateRunPace(time: runTime)
    }
    
    func showSwimPace(pace: Double){
        let roundPace = round(pace*100) / 100
        let minutesValue = Int(roundPace)
        let secondsValue = Int(roundPace.truncatingRemainder(dividingBy: 1) * 60)
        traithlonSwimPace.text = String(format: "%02d:%02d", minutesValue,secondsValue )
    }
    
    func showBikePace(pace: Double){
        var roundPace = pace * 3.6
        roundPace = round(100*roundPace)/100
        traithlonBikePace.text = String(format: "%.2f",roundPace)
    }
    
    func showRunPace(pace: Double){
        let roundPace = round(pace*100) / 100
        let minutesValue = Int(roundPace)
        let secondsValue = Int(roundPace.truncatingRemainder(dividingBy: 1) * 60)
        triathlonRunPace.text = String(format: "%02d:%02d", minutesValue,secondsValue )
    }
    
    func showActiveTime(){
        swimtActiveTime = swimtActiveTime.format(totalTime: totalTime * currentTriathlon.swimTimeRatio)
        biketActiveTime = biketActiveTime.format(totalTime: totalTime * currentTriathlon.bikeTimeRatio)
        runtActiveTime = runtActiveTime.format(totalTime: totalTime * currentTriathlon.runTimeRatio)
        
        hoursSwimTime.text = String(swimtActiveTime.hours)
        minutesSwimTime.text = String(swimtActiveTime.minutes)
        secondsSwimTime.text = String(swimtActiveTime.seconds)
        
        hoursBikeTime.text = String(biketActiveTime.hours)
        minutesBikeTime.text = String(biketActiveTime.minutes)
        secondsBikeTime.text = String(biketActiveTime.seconds)
        
        hoursRunTime.text = String(runtActiveTime.hours)
        minutesRunTime.text = String(runtActiveTime.minutes)
        secondsRunTime.text = String(runtActiveTime.seconds)
    }
    
    func calculateTriathlonPace(){
        currentSwimPace = calcTriathlonSwim()
        currentBikePace = calcTriathlonBike()
        currentRunPace = calcTriathlonRun()
        
        showSwimPace(pace: currentSwimPace)
        showBikePace(pace: currentBikePace)
        showRunPace(pace: currentRunPace)
    }
    
    
}
