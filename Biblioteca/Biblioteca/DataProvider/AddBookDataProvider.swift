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
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    weak var delegate: AddBookDataProviderDelegate?
    
    func hasTextFieldValue(value: String?) -> Bool {
        if value != nil {
            return true
        } else {
            return false
        }
    }
    
    
    func addBook(author: String, categoryType: String, isbn: String, language: String, price: Double, stock: Int16, title: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let bookEntity = NSEntityDescription.entity(forEntityName: "Book", in: managedContext)!
        
        let book = NSManagedObject(entity: bookEntity, insertInto: managedContext)
      
        book.setValue(author, forKey: "author")
        book.setValue(categoryType, forKey: "categoryType")
        book.setValue(isbn, forKey: "isbn")
        book.setValue(language, forKey: "language")
        book.setValue(price, forKey: "price")
        book.setValue(stock, forKey: "stock")
        book.setValue(title, forKey: "title")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("===== Deu bem ruim! \(error), \(error.userInfo)")
            
        }
    }
}
