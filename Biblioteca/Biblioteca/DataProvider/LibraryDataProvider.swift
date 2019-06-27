//
//  LibraryDataProvider.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 26/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

protocol LibraryDataProviderDelegate: class {
    func success()
    func failed()
}

class LibraryDataProvider {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var books = [Book]()
    private var filteredBooks = [Book]()
    
    func deleteAll(){
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
       
        
        do {
            _ = try context.execute(request)
        } catch {
            print("\(error)")
        }
        
    }
    
    weak var delegate: LibraryDataProviderDelegate?
    var book: [NSManagedObjectContext] = []
    
    func numberOfRowsInSection() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        
        do {
            let count = try context.count(for: fetchRequest)
            return count
        } catch {
            print("\(error)")
        }
        return 0
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
    
    func retriveStringData(forKey: String) -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return "" }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                return data.value(forKey: forKey) as! String
            }
        } catch {
            print("Deu ruim!")
        }
        return ""
    }
    
    func retriveInt16Data(forKey: String) -> Int16 {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return 0 }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                return data.value(forKey: forKey) as! Int16
            }
        } catch {
            print("Deu ruim!")
        }
        return 0
    }
    
    func retriveDoubleData(forKey: String) -> Double {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return 0.0 }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                return data.value(forKey: forKey) as! Double            }
        } catch {
            print("Deu ruim!")
        }
        return 0.0
    }
    
}
