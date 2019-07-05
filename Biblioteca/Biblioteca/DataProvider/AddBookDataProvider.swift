//
//  AddBookDataProvider.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 01/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

protocol AddBookDataProviderDelegate: class {
    func success()
    func failed()
}

class AddBookDataProvider {
    
    static let shared = AddBookDataProvider()
    var books: [Book] = []

    
    weak var delegate: AddBookDataProviderDelegate?
    
    func hasTextFieldValue(value: String?) -> Bool {
        if value != nil {
            return true
        } else {
            return false
        }
    }
    
    
    
   
}
