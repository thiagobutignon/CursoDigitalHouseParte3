//
//  Book+CoreDataProperties.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 26/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var isbn: String?
    @NSManaged public var stock: Int16
    @NSManaged public var price: Double
    @NSManaged public var language: String?

}
