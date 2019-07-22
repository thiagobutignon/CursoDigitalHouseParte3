//
//  DetailView.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 19/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var bookTypeLabel: UILabel!
    
    
    
    func setup(book: [Book]?) {
        
        
        guard let showBook = book else { return }
        titleLabel.text = showBook[0].title
        authorLabel.text = showBook[0].author
        isbnLabel.text = showBook[0].isbn
        languageLabel.text = showBook[0].language
        quantityLabel.text = showBook[0].stock
        priceLabel.text = showBook[0].price
        bookTypeLabel.text = showBook[0].categoryType

    }
    
}
