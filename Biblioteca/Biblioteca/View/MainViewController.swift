//
//  MainViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

protocol ColoredView {
    var controllerColor: UIColor { get set }
}

class MainViewController: UIViewController {
    
    var scrollViewController: ScrollViewController!
    
    lazy var addBookViewController: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "AddBookViewController")
    }()
    
    lazy var statisticViewController: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "StatisticViewController")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

}
