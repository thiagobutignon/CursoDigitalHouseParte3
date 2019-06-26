//
//  ProductDataProvider.swift
//  UIAlert
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

protocol ProductDataProviderDelegate: class {
    func success()
    func failed()
}

class ProductDataProvider {
    
    weak var delegate: ProductDataProviderDelegate?
    private var nameProduct: String?
    
    private var productsArray: [Product?] = [Product(nome:"Banana"), Product(nome:"Maça"), Product(nome:"Biscoito"), Product(nome:"Coca-Cola"), Product(nome:"Pizza")]
    
    
    func numberOfRowsInSection() -> Int {
        return self.productsArray.count
    }
    
    func addProduct() {
        let newProduct: Product = Product(nome: self.nameProduct ?? "")
        self.productsArray.append(newProduct)
        self.delegate?.success()
    }
    
    func removeProduct(index: Int) {
        self.productsArray.remove(at: index)
        self.delegate?.success()
    }
    
    func loadCurrentProduct(index: Int) -> Product? {
        return self.productsArray[index]
    }
    
    func setNameProduct(name: String) {
        self.nameProduct = name
    }
}
