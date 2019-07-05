//
//  Book+CoreDataClass.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 03/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//
//

import Foundation
import CoreData


public class Book: NSManagedObject {

    func create(with bookDictionary: [String: Any]) throws {
        guard let author = bookDictionary["author"] as? String,
            let categoryType = bookDictionary["title"] as? String,
            let isbn = bookDictionary["isbn"] as? String,
            let language = bookDictionary["language"] as? String,
            let price = bookDictionary["price"] as? String,
            let stock = bookDictionary["stock"] as? String,
            let title = bookDictionary["title"] as? String
            
            else { throw NSError(domain: "", code: 100, userInfo: nil)}
        
        self.author = author
        self.categoryType = categoryType
        self.isbn = isbn
        self.language = language
        self.price = price
        self.stock = stock
        self.title = title
    }
}
