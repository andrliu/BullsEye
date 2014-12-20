//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrew Liu on 12/17/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController
{
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

//    var currentValue: Int = 0
//    var targetValue: Int = 0
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Customize the graphics for the slider.
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft")
        {
            let trackLeftResizeable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizeable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight")
        {
            let trackRightResizeable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizeable, forState: .Normal)
        }
        startNewGame()
        updateLabels()
    }

    func updateLabels()
    {
//        targetLabel.text = "\(targetValue)"
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame()
    {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound()
    {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
    }
    
    @IBAction func startOver(sender: UIButton)
    {
        startNewGame()
        updateLabels()
        /*
        Create a Core Animation transition. 
        This will crossfade from what is currently on the screen to the changes that you're making below.
        */
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
    
    @IBAction func showAlert(sender: UIButton)
    {
//        var difference: Int
//        difference = currentValue - targetValue
//        if difference < 0
//        {
//            difference *= -1
//        }
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        var title: String
        if difference == 0
        {
            title = "Perfect!"
            points += 100
        }
        else if 0 < difference && difference < 10
        {
            title = "Almost!"
            if difference == 1
            {
                points += 50
            }
        }
        else
        {
            title = "Not even close..."
        }
//        score = score + points
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
                                                                            self.startNewRound()
                                                                            self.updateLabels()
                                                                        })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(slider: UISlider)
    {
        currentValue = lroundf(slider.value)
        println("The value of the slider is now: \(currentValue)")
    }
    
}

