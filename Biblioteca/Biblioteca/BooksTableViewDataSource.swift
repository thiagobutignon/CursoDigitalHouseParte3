//
//  BooksTableViewDataSource.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

final class BooksTableViewDataSource: NSObject {
    var books: [Book] {
        return fetchedResultController.fetchedObjects ?? []
    }
    
    weak var fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate?
    var fetchedResultController: NSFetchedResultsController<Book>!
}

extension BooksTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = fetchedResultController.object(at: indexPath)
        let reuseIndentifier = "bookCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier, for: indexPath) as? BookTableViewCell else { return UITableViewCell()}
        cell.setup(book: book)
        return cell
    }
    
    
}
