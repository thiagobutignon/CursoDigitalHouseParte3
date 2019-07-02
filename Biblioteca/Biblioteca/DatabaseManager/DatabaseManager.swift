//
//  DatabaseManager.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 01/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager {
    func save(params: [String: Any]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        
        let bookEntity = NSEntityDescription.entity(forEntityName: "Book", in: managedContext)!
        
        let book = NSManagedObject(entity: bookEntity, insertInto: managedContext)
    }
    
    func load(params: Book) {
        
    }
    
    func delete(params: Book) {
        
    }
}
