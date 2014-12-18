//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrew Liu on 12/17/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(sender: UIButton) {
    
    let alert = UIAlertController(title: "Hello, World", message: "This is my first app!", preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
    alert.addAction(action)
        
    presentViewController(alert, animated: true, completion: nil)
    
    }

}

