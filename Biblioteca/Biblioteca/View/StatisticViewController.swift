//
//  StatisticViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

class StatisticViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet var backgroundView: UIView!
    
    var controllerColor: UIColor = UIColor(red:0.42, green:0.36, blue:0.91, alpha:1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }


}

extension StatisticViewController: ColoredView {}

