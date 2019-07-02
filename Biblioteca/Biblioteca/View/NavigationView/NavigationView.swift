//
//  NavigationView.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 27/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    lazy var listButtonWidthConstraintConstant: CGFloat = {
        return self.listButtonWidthConstraint.constant
    }()
    
    lazy var listButtonBottomConstraintConstant: CGFloat = {
        return self.listButtonBottomConstraint.constant
    }()
    
    lazy var addIconWidthConstraintConstant: CGFloat = {
        return self.addIconWidthConstraint.constant
    }()
    
    lazy var addIconBottomConstraintConstant: CGFloat = {
        return self.addIconBottomConstraint.constant
    }()
    
    lazy var addIconHorizontalConstraintConstant: CGFloat = {
        return self.addIconHorizontalConstraint.constant
    }()
    
    lazy var statisticIconHorizontalConstraintConstant: CGFloat = {
        return self.statisticIconHorizontalConstraint.constant
    }()
    
    lazy var indicatorTransform: CGAffineTransform = {
        return self.listButtonView.transform
    }()
    
    @IBOutlet var listButtonView: UIView!
    @IBOutlet var listButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet var listButtonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet var addIconView: UIView!
    @IBOutlet var addIconWidthConstraint: NSLayoutConstraint!
    @IBOutlet var addIconBottomConstraint: NSLayoutConstraint!
    @IBOutlet var addIconHorizontalConstraint: NSLayoutConstraint!
    
    @IBOutlet var statisticIconView: UIView!
    @IBOutlet var statisticIconHorizontalConstraint: NSLayoutConstraint!
    
    @IBOutlet var indicator: UIView!
    
    @IBOutlet var colorView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        indicator.layer.cornerRadius = indicator.bounds.height / 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
    
    func animate(to controller: UIViewController?, percent: CGFloat) {
        
        
        let offset = abs(percent)
        
        animateIconPosition(offset: offset)
        animateIconScale(offset: offset)
        animateIconCenter(offset: offset)
        animateBottomBar(percent: percent)
        
        if let controller = controller as? ColoredView {
            colorView.backgroundColor = controller.controllerColor
        }
        
        var colorOffset = CGFloat(0.8)
        colorOffset = min(max(colorOffset, 0), 1)
        colorView.alpha = colorOffset
        
        layoutIfNeeded()
    }
}
