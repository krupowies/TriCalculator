//
//  TriOutputViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 07/10/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit

class TriOutputViewController: UIViewController {
    
    var totalTime = 0.0
    var distanceType = Triathlon(swimDistance: 0.0, bikeDistance: 0.0, runDistance: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        print(totalTime)
        print(distanceType)
    }
        
}
