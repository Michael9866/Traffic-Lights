//
//  ViewController.swift
//  Traffic Light 2.02
//
//  Created by Michael Caine on 16.11.2023.
//

import UIKit

// MARK: - ViewController
class ViewController: UIViewController {
    
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff = 0.3
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        startButton.layer.cornerRadius = 10
        
        startButton.setTitle("Start", for: .normal)
        
        // if keep following lines of code in viewDidLoad the depiction of views will be distorted
        //        redLight.layer.cornerRadius = redLight.frame.width / 2
        //        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        //        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        if startButton.currentTitle == "START" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redLight.alpha = lightIsOn
            greenLight.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .red
        }
    }
// or if method
//    if redLight.alpha == 1 {
//        redLight.alpha = 0.5
//        yellowLight.alpha = 1
//    } else if yellowLight.alpha == 1 {
//        greenLight.alpha = 1
//        yellowLight.alpha = 0.5
//    } else {
//        redLight.alpha = 1
//        greenLight.alpha = 0.5
//    }
  
        private func setupViews() {
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOff
        }
    }


