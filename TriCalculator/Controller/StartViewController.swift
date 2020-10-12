//
//  StartViewController.swift
//  TriCalculator
//
//  Created by Wojtek Krupowies on 02/10/2020.
//  Copyright © 2020 Wojtek Krupowies. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var swimButton: UIButton!
    @IBOutlet weak var bikeButton: UIButton!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var triathlonButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        swimButton.layer.cornerRadius = 5
        bikeButton.layer.cornerRadius = 5
        runButton.layer.cornerRadius = 5
        triathlonButton.layer.cornerRadius = 5
    }
    
}
