//
//  MainViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

protocol ColoredView {
    var controllerColor: UIColor { get set }
}

class MainViewController: UIViewController {
    
    var scrollViewController: ScrollViewController!
    
    lazy var addBookViewController: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "AddBookViewController")
    }()
    
    lazy var listBooksViewController: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "ListBooksViewController")
    }()
    
    lazy var statisticViewController: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "StatisticViewController")
    }()

    @IBOutlet var navigationView: NavigationView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ListBooksViewController {
            listBooksViewController = controller
        } else if let controller = segue.destination as? ScrollViewController {
            scrollViewController = controller
            scrollViewController.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainViewController {
    @IBAction func handleAddBookIconTap(_ sender: UITapGestureRecognizer) {
        scrollViewController.setController(to: addBookViewController, animated: true)
    }
    
    @IBAction func handleStatisticIconTap(_ sender: UITapGestureRecognizer) {
        scrollViewController.setController(to: statisticViewController, animated: true)
    }
    
    @IBAction func handleListButton(_ sender: UITapGestureRecognizer) {
        scrollViewController.setController(to: listBooksViewController, animated: true)
    }
}

extension MainViewController: ScrollViewControllerDelegate {
    var viewControllers: [UIViewController?] {
        return [addBookViewController,listBooksViewController, statisticViewController]
    }
    
    var initialViewController: UIViewController {
        return listBooksViewController
    }
    
    func scrollViewDidScroll() {
        let min: CGFloat = 0
        let max: CGFloat = scrollViewController.pageSize.width
        let x = scrollViewController.scrollView.contentOffset.x
        let result = ((x - min) / (max - min)) - 1
        
        var controller: UIViewController?
        
        if scrollViewController.isControllerVisible(addBookViewController) {
            controller = addBookViewController
        } else if scrollViewController.isControllerVisible(listBooksViewController) {
            controller = listBooksViewController
        }
        
        navigationView.animate(to: controller, percent: result)
    }
}
