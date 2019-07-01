//
//  BooksTableViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

class BooksTableViewController: UITableViewController  {
    
    var libraryDataProvider: LibraryDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        libraryDataProvider = LibraryDataProvider()
        libraryDataProvider?.delegate = self
        
        //        libraryDataProvider?.deleteAll()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return libraryDataProvider?.numberOfRowsInSection() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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


extension BooksTableViewController: LibraryDataProviderDelegate {
    func success() {
        
    }
    
    func failed() {
        
    }
}
