//
//  AddBookViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var tituloTextField: UITextField!
    
    @IBOutlet weak var autortextField: UITextField!
    
    @IBOutlet weak var isbnTextField: UITextField!
    
    
    
    
    @IBOutlet weak var idiomaTextField: UITextField!
    
    
    @IBOutlet weak var quantidadeTextField: UITextField!
    
    @IBOutlet weak var precoTextField: UITextField!
    
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    var addBookDataProvider: AddBookDataProvider?
    
    var controllerColor: UIColor = UIColor(red: 0.23, green: 0.66, blue: 0.96, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }
    
    @IBAction func addBookButton(_ sender: UIButton) {
    }
    
}

extension AddBookViewController: ColoredView {}

