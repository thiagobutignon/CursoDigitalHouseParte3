//
//  LoginController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 13/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

protocol LoginControllerDelegate: class {
    func success()
    func failed()
}

class LoginController {
    weak var delegate: LoginControllerDelegate?
    private var arrayLogin: [Login?] = []
    
    func getListLogin() {
        LoginDAO().getListLogin{
            (success, failure) in
            if failure {
                print("Login failed")
                self.delegate?.failed()
            } else {
                print("Deu tudo certo no carregamento")
                self.arrayLogin = success
                self.delegate?.success()
            }
        }
    }
    
    func createUser() {
        
    }
}
