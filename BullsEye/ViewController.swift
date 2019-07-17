//
//  ViewController.swift
//  BullsEye
//
//  Created by Tobias Hehrlein on 17.07.19.
//  Copyright © 2019 Tobias Hehrlein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var resetGameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) Points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {action in self.startNewRound(points: points) })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(points: Int) {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels(points: points)
    }
    
    func updateLabels(points: Int) {
        targetLabel.text = String(targetValue)
        
        round += 1
        roundLabel.text = String(round)
        
        score += points
        scoreLabel.text = String(score)
    }
    
    func addScore(points: Int) {
        score += points
        scoreLabel.text = String(score)
    }
    
    @IBAction func resetGame() {
        score = 0
        round = 0
        startNewRound(points: score)
    }
}

