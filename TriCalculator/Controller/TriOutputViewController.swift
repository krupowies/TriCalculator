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
    
    @IBOutlet weak var minutesSwimPace: UILabel!
    @IBOutlet weak var secondsSwimPace: UILabel!
    
    @IBOutlet weak var hoursBikeTime: UILabel!
    @IBOutlet weak var minutesBikeTime: UILabel!
    @IBOutlet weak var secondsBikeTime: UILabel!
    
    @IBOutlet weak var bikePace: UILabel!
    
    @IBOutlet weak var hoursRunTime: UILabel!
    @IBOutlet weak var minutesRunTime: UILabel!
    @IBOutlet weak var secondsRunTime: UILabel!
    
    @IBOutlet weak var minutesRunPace: UILabel!
    @IBOutlet weak var secondsRunPace: UILabel!
    
    
    var totalTime = 0.0
    var currentTriathlon = Triathlon(swimDistance: 0.0, bikeDistance: 0.0, runDistance: 0.0, swimTimeRatio: 0.0, bikeTimeRatio: 0.0, runTimeRatio: 0.0)

    
    @IBAction func fasterSwimButtonTap(_ sender: Any) {
    }
    
    @IBAction func slowerSwimButtonTap(_ sender: Any) {
    }
    
    @IBAction func fasterBikeButtonTap(_ sender: Any) {
    }
    
    @IBAction func slowerBikeButtonTap(_ sender: Any) {
    }
    

    @IBAction func fasterRunButtonTap(_ sender: Any) {
    }
    
    @IBAction func slowerRunButtonTap(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(totalTime)
        print(currentTriathlon)
    }
        
}
