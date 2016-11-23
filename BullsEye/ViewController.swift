//
//  ViewController.swift
//  BullsEye
//
//  Created by Kurtis Gibson on 2016-09-22.
//  Copyright © 2016 Kurtis Gibson. All rights reserved.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let distance = abs(targetValue - currentValue)
        let points = 100 - distance
        let title: String
        
        score += points
        
        if points < 50
        {
            title = "Not so good, pal."
        }
        
        else if points < 85
        {
            title = "I've seen worse."
        }
        
        else if points < 100
        {
            title = "Close but no cigar."
        }
        
        else
        {
            title = "Holy mackerel!"
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Alright", style: .default, handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        //print("The value of the slider is now \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(50)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startOver() {
        round = 0
        score = 0
        startNewRound()
    }

}

