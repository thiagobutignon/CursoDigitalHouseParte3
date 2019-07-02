//
//  Book+CoreDataProperties.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 01/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var categoryType: String?
    @NSManaged public var isbn: String?
    @NSManaged public var language: String?
    @NSManaged public var price: Double
    @NSManaged public var stock: Int16
    @NSManaged public var title: String?
    @NSManaged public var idThumbnail: Thumbnail?

}
