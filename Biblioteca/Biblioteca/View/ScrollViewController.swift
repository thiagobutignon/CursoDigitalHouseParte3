//
//  ScrollViewController.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

protocol ScrollViewControllerDelegate {
    var viewControllers: [UIViewController?] { get }
    var initialViewController: UIViewController { get }
    func scrollViewDidScroll()
}

class ScrollViewController: UIViewController {

    var scrollView: UIScrollView {
        return view as! UIScrollView
    }
    
    var pageSize: CGSize {
        return scrollView.frame.size
    }
    
    var viewControllers: [UIViewController?]!
    var delegate: ScrollViewControllerDelegate?
    
    override func loadView() {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        view = scrollView
        view.backgroundColor = .clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewControllers = delegate?.viewControllers
        
        for (index, controller) in viewControllers.enumerated() {
            if let controller = controller {
                addChild(controller)
                controller.view.frame = frame(for: index)
                scrollView.addSubview(controller.view)
                controller.didMove(toParent: self)
            }
        }
        
        scrollView.contentSize = CGSize(width: pageSize.width * CGFloat(viewControllers.count), height: pageSize.height)
        
        if let controller = delegate?.initialViewController {
            setController(to: controller, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

fileprivate extension ScrollViewController {
    func frame(for index: Int) -> CGRect {
        return CGRect(x: CGFloat(index) * pageSize.width,
                      y: 0,
                      width: pageSize.width,
                      height: pageSize.height)
    }
    
    func indexFor(controller: UIViewController?) -> Int? {
        return viewControllers.firstIndex(where: {$0 == controller})
    }
}

extension ScrollViewController {
    public func setController(to controller: UIViewController, animated: Bool) {
        guard let index = indexFor(controller: controller) else { return }
        let contentOffset = CGPoint(x: pageSize.width * CGFloat(index), y: 0)
        
        if animated {
            UIView.animate(withDuration: 0.2, delay: 0, options: [UIView.AnimationOptions.curveEaseOut], animations: {
                self.scrollView.setContentOffset(contentOffset, animated: false)
            })
        } else {
            scrollView.setContentOffset(contentOffset, animated: animated)
        }
    }
    
    public func isControllerVisible(_ controller: UIViewController?) -> Bool {
        guard controller != nil else { return false }
        for i in 0..<viewControllers.count {
            if viewControllers[i] == controller {
                let controllerFrame = frame(for: i)
                return controllerFrame.intersects(scrollView.bounds)
            }
        }
        return false
    }
}


extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll()
    }
}
