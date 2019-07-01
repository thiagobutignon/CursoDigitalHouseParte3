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
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var controllerColor: UIColor = UIColor(red: 0.29, green: 0.53, blue: 0.36, alpha: 1.0)
    
    var libraryDataProvider: LibraryDataProvider?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
        libraryDataProvider = LibraryDataProvider()
        libraryDataProvider?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ListBooksViewController: ColoredView {}

extension ListBooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryDataProvider?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell()}
        
        do {
            if let lb = libraryDataProvider {
                cell.stockLabel?.text = String(lb.retriveInt16Data(forKey: "stock"))
                cell.authorLabel?.text = lb.retriveStringData(forKey: "author")
                cell.titleLabel?.text = lb.retriveStringData(forKey: "title")
            }
            
        }
        
        return cell
    }
    
}

extension ListBooksViewController: LibraryDataProviderDelegate {
    func success() {
        
    }
    func failed() {
        
    }
}
