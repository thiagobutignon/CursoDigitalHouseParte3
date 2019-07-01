//
//  StatisticViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    
    var controllerColor: UIColor = UIColor(red:0.99, green:0.80, blue:0.43, alpha:1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }


}

extension StatisticViewController: ColoredView {}

