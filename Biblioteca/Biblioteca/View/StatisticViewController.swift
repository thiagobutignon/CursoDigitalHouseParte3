//
//  StatisticViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit
import CoreData

class StatisticViewController: UIViewController {
    
    var book: [Book]?
    var screenType: ScreenType = .statistic
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet var backgroundView: UIView!
    
    var controllerColor: UIColor = UIColor(red:0.42, green:0.36, blue:0.91, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
    }
    
    
    func setupView() {
        for v in self.backgroundView.subviews {
            v.removeFromSuperview()
        }
        switch self.screenType {
        case .detail:
            self.detailView()
            break
        case .statistic:
            self.estasticaView()
            break
        case .none:
            break
        }
        
    }
    
    func hideView() {
        switch self.screenType {
        case .detail:
            for v in self.backgroundView.subviews {
                v.isHidden = true
            }
            break
        case .statistic:
            break
            
        case .none:
            break
        }
    }
    
    
    func detailView() {
        let frame = backgroundView.frame
        let detailView = Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)!.last as! DetailView
        detailView.frame = frame
        detailView.setup(book: self.book)
        detailView.layer.cornerRadius = 20
        detailView.layer.masksToBounds = true
        self.backgroundView.addSubview(detailView)
    }
    
    func estasticaView() {
        let frame = backgroundView.frame
        let estatisticaView = Bundle.main.loadNibNamed("EstatisticaView", owner: self, options: nil)!.last as! EstatisticaView
        estatisticaView.frame = frame
        estatisticaView.setup(books: self.book)
        estatisticaView.layer.cornerRadius = 20
        estatisticaView.layer.masksToBounds = true
        self.backgroundView.addSubview(estatisticaView)
    }
}

extension StatisticViewController: ColoredView {}

