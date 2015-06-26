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
    
    //store the original location of card
    private var originalPoint: CGPoint?
    
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
        //card.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        card.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        //setConstraints()
    }
    
    //MARK: - functions 
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
        let distance = gestureRecognizer.translationInView(self)
        println("Distance x:\(distance.x) y: \(distance.y)")
        
        //update this function to return to center
        switch gestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            //when we start dragging, tell our original point that it is the center
            originalPoint = center //center property is from UIView
        case UIGestureRecognizerState.Changed:
            //superview is the cardstackview
            let rotationPercentage = min(distance.x/(self.superview!.frame.width/2), 1)
            let rotationAngle = (CGFloat(2*M_PI/16) * rotationPercentage)
            //gives us how much to rotate
            transform = CGAffineTransformRotate(transform, rotationAngle)
            
            
            
            center = CGPointMake(originalPoint!.x + distance.x, originalPoint!.y + distance.y)
        case UIGestureRecognizerState.Ended:
            resetViewPositionAndTransformations()
        default:
            //something went wrong here
            println("Default triggered for GestureRecognizer")
            break
        }
        
    }
    
    //snap back to center after moving
    private func resetViewPositionAndTransformations() {
        UIView.animateWithDuration(0.2, animations: { () -> Void in self.center = self.originalPoint!
        self.transform = CGAffineTransformMakeRotation(0)
        })
    }

    
    
//    private func setConstraints() {
//        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
//        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
//        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0))
//        addConstraint(NSLayoutConstraint(item: card, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0))
//        
//    }
    
}