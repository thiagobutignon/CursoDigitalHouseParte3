//
//  ViewController.swift
//  UIAlert
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController {
    var dataProvider: ProductDataProvider?
    
    @IBOutlet weak var productListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataProvider = ProductDataProvider()
        self.productListTableView.delegate = self
        self.productListTableView.dataSource = self
        self.dataProvider?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let alerta = UIAlertController(title: "Alerta", message: "Deseja adicionar esse item?", preferredStyle: .alert)
        
        alerta.addTextField { (textfield) in
            textfield.delegate = self
            
            textfield.placeholder = "Nome do produto"
        }
        let btnOK = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.dataProvider?.addProduct()
        }
        
        let btnCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(btnOK)
        alerta.addAction(btnCancel)
        
        self.present(alerta, animated: true, completion: nil)
    }
}

extension ListaViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.dataProvider?.setNameProduct(name: textField.text ?? "")
    }
}

extension ListaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.dataProvider?.loadCurrentProduct(index: indexPath.row)?.nome
        return cell
    }
    
    
}


extension ListaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alerta = UIAlertController(title: "Alerta", message: "Deseja mesmo deletar esse item?", preferredStyle: .actionSheet)
        
        let btnCancelar = UIAlertAction(title: "Cancelar", style: .default) { (indexPath) in
            print("Cancelou!!")
        }
        
        let btnConfirmar = UIAlertAction(title: "Confirmar", style: .destructive) { (success) in
            self.dataProvider?.removeProduct(index: indexPath.row)
        }
        
        alerta.addAction(btnCancelar)
        alerta.addAction(btnConfirmar)
        
        self.present(alerta, animated: true, completion: nil)
        
        
    }
}


extension ListaViewController: ProductDataProviderDelegate {
    func success() {
        self.productListTableView.reloadData()
    }
    
    func failed() {
        print("falhou")
    }
}
