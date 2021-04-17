//
//  TriCalculatorTests.swift
//  TriCalculatorTests
//
//  Created by Wojtek Krupowies on 16/04/2021.
//  Copyright © 2021 Wojtek Krupowies. All rights reserved.
//

import XCTest
@testable import TriCalculator

class TriCalculatorTests: XCTestCase {

    func testcalculateSwimPace(){
        let swimPace = calculateSwimPace(distance: 3000, time: 2700)
        XCTAssertEqual(swimPace, 1.5) //1.5 is equal to 1 min and 30 sec
    }
    
    func testCalculateBikePace(){
        let bikePace = calculateBikePace(distance: 45000, time: 3600)
        XCTAssertEqual(bikePace, 12.5) //12.5 m/s equals 45 km/h
    }
    
//    func testCalculateRunPace(){
//
//    }

}
