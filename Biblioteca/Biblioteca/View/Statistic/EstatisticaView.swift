//
//  EstatisticaView.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 19/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class EstatisticaView: UIView {
    
    @IBOutlet weak var quantidadeTitulosLabel: UILabel!
    
    @IBOutlet weak var quantidadeLivrosLabel: UILabel!
    
    @IBOutlet weak var valorColecaoLabel: UILabel!
    
    func setup(books: [Book]?) {
        
        guard let showBooks = books else { return }
        quantidadeTitulosLabel.text = "\(self.countTitles(books: showBooks))"
        quantidadeLivrosLabel.text = "\(self.countQuantidade(books: showBooks))"
        valorColecaoLabel.text = "\(self.countValorColecao(books: showBooks))"
    }
    
    func countTitles(books: [Book]?) -> Int {
        return books?.count ?? 0
    }
    
    func countQuantidade(books: [Book]?) -> Int {
        var i: Int = 0
        for value in books ?? [] {
            i +=  Int(value.stock!) ?? 0
        }
        return i
    }
    
    func countValorColecao(books: [Book]?) -> Int {
        var i: Int = 0
        for value in books ?? [] {
            i += Int(value.price!) ?? 0
        }
        return i
    }
}
