//
//  CardView.swift
//  NISDate
//
//  Created by Nicholai de Guzman on 6/25/15.
//  Copyright (c) 2015 Nic. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    
    //both are initialized inline
    private let imageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    //MARK: - other intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    init() {
        super.init(frame: CGRectZero)
        initialize()
    }
    
    private func initialize() {
        
        //we use our own constraints
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        imageView.backgroundColor = UIColor.redColor()
        addSubview(imageView)
        nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(nameLabel)
        backgroundColor = UIColor.whiteColor()
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGrayColor().CGColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
}