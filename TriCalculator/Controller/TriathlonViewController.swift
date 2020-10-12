//
//  TriathlonViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 07/10/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit

class TriathlonViewController: UIViewController {
    
    
    @IBOutlet weak var triHours: UITextField!
    @IBOutlet weak var triMinutes: UITextField!
    @IBOutlet weak var triSeconds: UITextField!
    var eventTag: Int = 0
    
    @IBOutlet weak var eventTextField: UITextField!
    var eventsTab = ["Double Ironman","Ironman", "1/2 Ironman", "Olympic", "Sprint"]
    var eventPickerView = UIPickerView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        eventPickerView.delegate = self
        eventPickerView.dataSource = self
        eventTextField.delegate = self
        eventTextField.inputView = eventPickerView
    }
    
    @IBAction func calcTriPaceButton(_ sender: Any) {
        print(createTriDistance(tag: eventTag))
    }
    
    
    func getTriathlonTime() ->TimeInterval{
        let hours = (Double(triHours.text!) ?? 0)
        let minutes = (Double(triMinutes.text!) ?? 0)
        let seconds = (Double(triSeconds.text!) ?? 0)
        
        return (hours*3600 + minutes * 60 + seconds)
    }
    
    func createTriDistance(tag: Int) -> Triathlon {
        switch tag {
        case 0:
            print(tag)
            return Triathlon(swimDistance: 7.6, bikeDistance: 360.0, runDistance: 84.4)
        case 1:
            print(tag)
            return Triathlon(swimDistance: 3.8, bikeDistance: 180.0, runDistance: 42.2)
        case 2:
            print(tag)
            return Triathlon(swimDistance: 1.9, bikeDistance: 90.0, runDistance: 21.1)
        case 3:
            print(tag)
            return Triathlon(swimDistance: 1.5, bikeDistance: 45.0, runDistance: 10.0)
        case 4:
            print(tag)
            return Triathlon(swimDistance: 0.75, bikeDistance: 20.0, runDistance: 5.0)
        default:
            print(0)
            return Triathlon(swimDistance: 0.0, bikeDistance: 0.0, runDistance: 0.0)
        }
    }
    
}

extension TriathlonViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return eventsTab.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return eventsTab[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        eventTextField.text = eventsTab[row]
        eventTextField.resignFirstResponder()
        eventTag = row
    }
}

extension TriathlonViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
