//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Blake Ledden on 7/25/19.
//  Copyright © 2019 Blake Ledden. All rights reserved.
//

// TO-DO:
//
// Improve the HTML page utilized in the WebView
// It looked better beforehand, but this gets me more familiar with using different tools

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
            
        }
    }
    
    @IBAction func close() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
