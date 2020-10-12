//
//  BikeViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 02/10/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit

class BikeViewController: UIViewController {
    
    //Bike Distance TextFields
    @IBOutlet weak var bikeKilometers: UITextField!
    @IBOutlet weak var bikeMeters: UITextField!
    //Bike Time TextFields
    @IBOutlet weak var bikeHours: UITextField!
    @IBOutlet weak var bikeMinutes: UITextField!
    @IBOutlet weak var bikeSeconds: UITextField!
    //Bike Pace Lable
    @IBOutlet weak var bikePace: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bikeKilometers.delegate = self
        bikeMeters.delegate = self
        bikeHours.delegate = self
        bikeMinutes.delegate = self
        bikeSeconds.delegate = self
    }
    
    @IBAction func calculateBikePaceButton(_ sender: Any) {
        let currentTime = getBikeTime()
        let currentDistance = getBikeDistance()
        let currentPace = calculateBikePace(distance: currentDistance, time: currentTime)
        showBikePace(pace: currentPace)
    }
    
    func getBikeTime() -> TimeInterval {
        let hours = (Double(bikeHours.text!) ?? 0)
        let minutes = (Double(bikeMinutes.text!) ?? 0)
        let seconds = (Double(bikeSeconds.text!) ?? 0)
        
        return (hours*3600 + minutes * 60 + seconds)
    }
    
    func getBikeDistance() -> Double {
        let kilometers = (Double(bikeKilometers.text!) ?? 0)
        let meters = (Double(bikeMeters.text!) ?? 0)
        
        return kilometers*1000 + meters
    }
    
    func calculateBikePace(distance: Double, time: TimeInterval)-> Double {
        return distance/time
    }
    
    func showBikePace(pace: Double) {
        print(pace)
        var roundPace = pace * 3.6
        print(roundPace)
        roundPace = round(100*roundPace)/100
        print(roundPace)
        bikePace.text = String(format: "%.2f",roundPace)
    }
}

extension BikeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if allowedCharacters.isSuperset(of: characterSet) && textField == bikeKilometers || textField == bikeMeters {
            let maxLength = 3
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        } else if allowedCharacters.isSuperset(of: characterSet) && textField == bikeHours || textField == bikeMinutes || textField == bikeSeconds {
            let maxLength = 2
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
        
            return newString.length <= maxLength
        }
      return false
    }
}

