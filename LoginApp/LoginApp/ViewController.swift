//
//  ViewController.swift
//  LoginApp
//
//  Created by Thiago B Claramunt on 18/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import PMSuperButton

class ViewController: UIViewController {

    @IBOutlet weak var button: PMSuperButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func teste(_ sender: PMSuperButton) {
        button.showLoader(userInteraction: true)
        
        print("Funciona")
        
        
    }
    
}

