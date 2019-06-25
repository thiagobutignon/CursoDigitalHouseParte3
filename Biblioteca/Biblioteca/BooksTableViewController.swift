//
//  BooksTableViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 25/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

protocol BooksData {
    func createBook()
    func retriveBooks()
}

class BooksTableViewController: UITableViewController  {
    
    lazy var dataSource: BooksTableViewDataSource = {
        let dataSource = BooksTableViewDataSource()
        dataSource.fetchedResultControllerDelegate = self as? NSFetchedResultsControllerDelegate
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBook()
        retriveBooks()
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "bookCell")
        tableView.dataSource = dataSource
     
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension BooksTableViewController: BooksData {
   
    func createBook() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let bookEntity = NSEntityDescription.entity(forEntityName: "Book", in: managedContext)!
        
        for i in 1...10 {
            let book = NSManagedObject(entity: bookEntity, insertInto: managedContext)
            print("Deu bom \(i)")
            book.setValue("Anita Deak \(i)", forKey: "author")
            book.setValue("Outros", forKey: "categoryType")
            book.setValue("isbn \(i)", forKey: "isbn")
            book.setValue("pt-br", forKey: "language")
            book.setValue(40.00, forKey: "price")
            book.setValue(10, forKey: "stock")
            book.setValue("No fundo do Oceano os Animais invísiveis", forKey: "title")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("===== Deu bem ruim! \(error), \(error.userInfo)")
            
        }
    }
    
    func retriveBooks() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "author") as! String)
            }
        } catch {
            print("Deu ruim!")
        }
    }
}
