//
//  Book.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

enum CategoryType {
    case ios, android, web, outros
}


struct Book {
    var title: String
    var author: String
    var isbn: String
    var stock: Int
    var price: Double
    var language: String
    var categoryType: CategoryType
}
