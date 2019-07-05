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
    
    static let shared = LibraryDataProvider()
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    
    weak var delegate: LibraryDataProviderDelegate?
    var book: [NSManagedObjectContext] = []
    
    func numberOfRowsInSection() -> Int {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
//        
//        do {
//            let count = try context.count(for: fetchRequest)
//            return count
//        } catch {
//            print("\(error)")
//        }
        return 0
    }
    
}


