//
//  BookTableViewCell.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func setup(book: Book) {
        stockLabel.text = String(book.stock)
        authorLabel.text = book.author
        titleLabel.text = book.title
    }
}
