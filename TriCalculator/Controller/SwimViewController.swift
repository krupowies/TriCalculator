//
//  SwimViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 28/09/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit
import Foundation

class SwimViewController: UIViewController {
    
    //Swim Distance TextFields
    @IBOutlet weak var swimKilometers: UITextField!
    @IBOutlet weak var swimMeters: UITextField!
    //Swim Time TextFields
    @IBOutlet weak var swimHours: UITextField!
    @IBOutlet weak var swimMinutes: UITextField!
    @IBOutlet weak var swimSeconds: UITextField!
    //Swim Pace Label
    @IBOutlet weak var swimPace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swimKilometers.delegate = self
        swimMeters.delegate = self
        swimHours.delegate = self
        swimMinutes.delegate = self
        swimSeconds.delegate = self
    }
    
    @IBAction func calculateSwimPaceButton(_ sender: Any) {
        let currentTime = getSwimTime()
        let currentDistance = getSwimDistance()
        let currentPace = calculateSwimPace(distance: currentDistance, time: currentTime)
        showSwimPace(pace: currentPace)
    }
    
    func getSwimTime() -> TimeInterval {
        let hours = (Double(swimHours.text!) ?? 0)
        let minutes = (Double(swimMinutes.text!) ?? 0)
        let seconds = (Double(swimSeconds.text!) ?? 0)
        
        return (hours*3600 + minutes * 60 + seconds)
    }
    
    func getSwimDistance() -> Double {
        let kilometers = (Double(swimKilometers.text!) ?? 0)
        let meters = (Double(swimMeters.text!) ?? 0)
        
        return kilometers*1000 + meters
    }
        
    func showSwimPace(pace: Double){
        let roundPace = round(pace*100) / 100
        let minutesValue = Int(roundPace)
        let secondsValue = Int(roundPace.truncatingRemainder(dividingBy: 1) * 60)
        swimPace.text = String(format: "%02d:%02d", minutesValue,secondsValue )
    }
}

//extension responsible for limited number of characters in TextFields
//3 characters for distance fields and 2 characters for time fields

extension SwimViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if allowedCharacters.isSuperset(of: characterSet) && textField == swimKilometers || textField == swimMeters {
            let maxLength = 3
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        } else if allowedCharacters.isSuperset(of: characterSet) && textField == swimHours || textField == swimMinutes || textField == swimSeconds {
            let maxLength = 2
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
        
            return newString.length <= maxLength
        }
      return false
    }
}
