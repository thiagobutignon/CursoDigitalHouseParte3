//
//  NavigationViewAnimation.swift
//  Biblioteca
//
//  Created by Thiago B Claramunt on 01/07/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

extension NavigationView {
    func animateIconPosition(offset: CGFloat) {
        let finalDistanceFromBottom: CGFloat = 25.0
        var distance = listButtonBottomConstraintConstant - finalDistanceFromBottom
        listButtonBottomConstraint.constant = listButtonBottomConstraintConstant - (distance * offset)
        
        distance = addIconBottomConstraintConstant - finalDistanceFromBottom
        addIconBottomConstraint.constant = addIconBottomConstraintConstant - (distance * offset)
    }
    
    func animateIconScale(offset: CGFloat) {
        let finalWidthScale: CGFloat = listButtonWidthConstraintConstant * 0.2
        listButtonWidthConstraint.constant = listButtonWidthConstraintConstant - (finalWidthScale * offset)
        let scale = addIconWidthConstraintConstant * 0.2
        addIconWidthConstraint.constant = addIconWidthConstraintConstant - (scale * offset)
    }
    
    func animateIconCenter(offset: CGFloat) {
        let originalMultiplier = addIconHorizontalConstraint.multiplier * bounds.width * 0.5
        let newMultiplier = (bounds.width * 0.54 * 0.5) - originalMultiplier
        addIconHorizontalConstraint.constant = newMultiplier * offset
        statisticIconHorizontalConstraint.constant = -newMultiplier * offset
    }
    
    func animateBottomBar(percent: CGFloat) {
        let offset = abs(percent)
        let scaleTransform = CGAffineTransform(scaleX: offset, y: 1)
        let distance = 0.23 * bounds.width
        
        let transform = indicatorTransform.translatedBy(x: distance * percent, y: 0)
        indicator.transform = transform.concatenating(scaleTransform)
        indicator.alpha = offset
    }
}
