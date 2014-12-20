//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Andrew Liu on 12/19/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Load the BullsEye.html file into the web view.
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html")
        {
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
    }
    
    @IBAction func close(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
