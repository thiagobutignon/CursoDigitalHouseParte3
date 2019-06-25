//
//  ViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    let usernameAlert = UIAlertController(title: "Usuário não encontrado", message: "Coloque um nome de usuário válido", preferredStyle: .alert)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if usernameTextField.hasText == true {
            performSegue(withIdentifier: "loggedIn", sender: nil)
        } else {
            usernameAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(usernameAlert, animated: true, completion: nil)
        }
    }
}
