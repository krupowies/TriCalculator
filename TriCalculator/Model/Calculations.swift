//
//  Calculations.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 17/04/2021.
//  Copyright © 2021 Wojtek Krupowies. All rights reserved.
//

import Foundation

func calculateSwimPace(distance: Double, time: TimeInterval) -> Double{
    return ((time / (distance / 100)) / 60)
}

func calculateBikePace(distance: Double, time: TimeInterval)-> Double {
    return (distance/time)
}

func calculateRunPace(distance: Double, time: TimeInterval) -> Double {
    return ((time/(distance/1000)) / 60)
}
