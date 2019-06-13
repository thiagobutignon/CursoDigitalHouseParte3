//
//  LoginDAO.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 13/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

class LoginDAO {
    typealias completion <T> = (_ result: T, _ failure: Bool) -> Void
    
    func getListLogin(completion: @escaping completion<[Login?]>) {
        if let path = Bundle.main.path(forResource: "login", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let _jsonResult = jsonResult as? [Dictionary<String, String>] {
                    
                    print("deu tudo certo!!!")
                    print(_jsonResult)
                    
                    var arrayLogin: [Login] = []
                    
                    for value in _jsonResult {
                        let login: Login = Login(dic: value)
                        arrayLogin.append(login)
                    }
                    
                    completion(arrayLogin, false)
                }
            } catch {
                print("------ deu muito ruim!!!")
                completion([], true)
            }
        }
    }
}
