//
//  ViewController.swift
//  Wanderer
//
//  Created by Rob Munro on 21/10/2018.
//  Copyright © 2018 Rob Munro. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var startExploringButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startExploringButton.layer.cornerRadius = 15
        startExploringButton.layer.masksToBounds = true
        
        
    }
    
    
    


}

