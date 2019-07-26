//
//  ViewController.swift
//  BullsEye
//
//  Created by Blake Ledden on 7/22/19.
//  Copyright © 2019 Blake Ledden. All rights reserved.
//
// This project is not in MVC or MVVM format, nor utilizes any APIs

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var roundCounter = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        
        currentValue = Int(roundedValue)
        
        startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
    }
    
    
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        
        
        
        let title: String
        
        var message = "You scored \(points) points!"
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
            message = message + "\nPlus 100 bonus points for getting it dead-on!"
        }
        else if difference == 1 {
            title = "You almost had it!"
            points += 50
            message = message + "\nPlus 50 bonus points for getting within 1 spot of the target!"
        }
        else if difference < 10 && difference > 1 {
            title = "Pretty good!"
            message = message + "\nYou were \(difference) spots away from hitting the target."
        }
        else {
            title = "Not even close..."
            points -= difference + points
            message = "You have been deducted \(abs(points)) points for missing so poorly." + "\nYou were \(difference) spots away from hitting the sweet zone."
        }
        
        score += points
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        let roundedValue = slider.value.rounded()
        
        currentValue = Int(roundedValue)
        
    }
    
    func startNewRound() {
        
        targetValue = Int.random(in: 0...100)
        currentValue = 50
        slider.value = Float(currentValue)
        roundCounter += 1
        updateLabels()
        
    }
    
    func updateLabels() {
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundCounter)
        
    }
    
    @IBAction func startOver() {
        
        score = 0
        roundCounter = 1
        updateLabels()
        
    }

}

