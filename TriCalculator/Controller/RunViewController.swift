//
//  RunViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 02/10/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit

class RunViewController: UIViewController {
    
    //Run Distance TextField
    @IBOutlet weak var runKilometers: UITextField!
    @IBOutlet weak var runMeters: UITextField!
    //Run Time TextFields
    @IBOutlet weak var runHours: UITextField!
    @IBOutlet weak var runMinutes: UITextField!
    @IBOutlet weak var runSeconds: UITextField!
    //Run Pace Label
    @IBOutlet weak var runPace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runKilometers.delegate = self
        runMeters.delegate = self
        runHours.delegate = self
        runMinutes.delegate = self
        runSeconds.delegate = self
    }
    
    @IBAction func calculateRunPaceButton(_ sender: Any) {
        let currentTime = getRunTime()
        print(currentTime)
        let currentDistance = getRunDistance()
        print(currentDistance)
        let currentPace = calculateRunPace(distance: currentDistance, time: currentTime)
        print(currentPace)
        showRunPace(pace: currentPace)
    }
    
    func getRunTime() -> TimeInterval {
        let hours = (Double(runHours.text!) ?? 0)
        let minutes = (Double(runMinutes.text!) ?? 0)
        let seconds = (Double(runSeconds.text!) ?? 0)
        
        return (hours*3600 + minutes * 60 + seconds)
    }
    
    func getRunDistance() -> Double {
        let kilometers = (Double(runKilometers.text!) ?? 0)
        let meters = (Double(runMeters.text!) ?? 0)
        
        return kilometers*1000 + meters
    }
        
    func showRunPace(pace: Double){
        let roundPace = round(pace*100) / 100
        let minutesValue = Int(roundPace)
        let secondsValue = Int(roundPace.truncatingRemainder(dividingBy: 1) * 60)
        runPace.text = String(format: "%02d:%02d", minutesValue,secondsValue )
    }
}

extension RunViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if allowedCharacters.isSuperset(of: characterSet) && textField == runKilometers || textField == runMeters {
            let maxLength = 3
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        } else if allowedCharacters.isSuperset(of: characterSet) && textField == runHours || textField == runMinutes || textField == runSeconds {
            let maxLength = 2
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
        
            return newString.length <= maxLength
        }
      return false
    }
}
