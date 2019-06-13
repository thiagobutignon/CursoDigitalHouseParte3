//
//  Login.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 13/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

class Login {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(dic: [String: String]) {
        self.name = dic["name"]
    }
}
