//
//  SwipeView.swift
//  NISDate
//
//  Created by Nicholai de Guzman on 6/25/15.
//  Copyright (c) 2015 Nic. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView {
    private let card: CardView = CardView()
    
    
    //MARK: - initializers
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    init() {
        super.init(frame: CGRectZero)
        initialize()
    }
    private func initialize() {
        self.backgroundColor = UIColor.clearColor()
        addSubview(card)
        
        //dragged is a function; the colon (:) is because it takes a parameter
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
        
        //we'll define the constraints ourselves
        card.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        setConstraints()
    }
    
    //MARK: - functions 
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
        let distance = gestureRecognizer.translationInView(self)
        println("Distance x:\(distance.x) y: \(distance.y)")
    }
    
    
    
    private func setConstraints() {
        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0))
        
    }
    
}