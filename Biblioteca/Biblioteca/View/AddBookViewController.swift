//
//  AddBookViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

class AddBookViewController: UIViewController {
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var autortextField: UITextField!
    @IBOutlet weak var isbnTextField: UITextField!
    @IBOutlet weak var idiomaTextField: UITextField!
    @IBOutlet weak var quantidadeTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    var addBookDataProvider: AddBookDataProvider?
    
    var controllerColor: UIColor = UIColor(red: 0.23, green: 0.66, blue: 0.96, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }
    var stringSegmentedControl: String?
    @IBAction func indexChanged(_ sender: Any) {
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            self.stringSegmentedControl = "iOS"
        case 1:
            self.stringSegmentedControl = "Android"
        case 2:
            self.stringSegmentedControl = "Web"
        case 3:
            self.stringSegmentedControl = "Outros"
        default:
            break
        }
    }
    
    @IBAction func addBookButton(_ sender: UIButton) {
        
        if let title = self.tituloTextField.text,
            let author = self.autortextField.text,
            let isbn = self.isbnTextField.text,
            let language = self.idiomaTextField.text,
            let category = self.stringSegmentedControl,
            let stock = self.quantidadeTextField.text,
            let price = self.precoTextField.text {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newBook = Book(context: context)
            newBook.title = title
            newBook.author = author
            newBook.isbn = isbn
            newBook.language = language
            newBook.categoryType = category
            newBook.stock = stock
            newBook.price = price
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.showSuccess()
            self.reloadTableView()
            
            
        }
    }
    
    
}



extension AddBookViewController: ColoredView {}


extension AddBookViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showSuccess(){
        let alert = UIAlertController(title: "Sucesso!", message: "Novo livro carregado com sucesso", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: {(self.clearFields())})
    }
    
    func clearFields() {
        self.tituloTextField.text = ""
        self.autortextField.text = ""
        self.isbnTextField.text = ""
        self.idiomaTextField.text = ""
        self.stringSegmentedControl = ""
        self.quantidadeTextField.text = ""
        self.precoTextField.text = ""
    }
    
    func reloadTableView() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
}
