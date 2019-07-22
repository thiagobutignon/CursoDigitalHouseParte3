//
//  ListBooksViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData


class ListBooksViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var welcomeText: String?
    
    @IBOutlet var backgroundView: UIView!
    var controllerColor: UIColor = UIColor(red:0.99, green:0.80, blue:0.43, alpha:1.0)
    
    @IBOutlet weak var tableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var books: [Book] = []
    var libraryDataProvider: LibraryDataProvider?
    var selectedIndex: Int!
    var filteredBook: [Book] = []
    var delegate: ScrollViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
        libraryDataProvider = LibraryDataProvider()
        libraryDataProvider?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.fetchData), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.welcomeLabel.text = "Bem vindo \(self.welcomeText ?? "") "
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData()
    }
    
    @objc func fetchData() {
        do {
            books = try context.fetch(Book.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("---- Não temos dados!")
        }
    }
    
}

extension ListBooksViewController: ColoredView {}

extension ListBooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell()}
        let book = books[indexPath.row]
        
        cell.authorLabel.text = book.author
        cell.titleLabel.text = book.title
        cell.stockLabel.text = book.stock
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.filteredBook = [self.books[selectedIndex]]
        
        let bookData = self.filteredBook
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "mudarTela"), object: nil, userInfo: ["bookData" : bookData])
    }
    
}

extension ListBooksViewController {
    
}

extension ListBooksViewController: LibraryDataProviderDelegate {
    func success() {
        
    }
    func failed() {
        
    }
}



