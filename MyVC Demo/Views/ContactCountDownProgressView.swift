//
//  ContactCountDownProgressView.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/14/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ContactCountDownProgressView : UIProgressView {
    
    var propertyObservation: NSKeyValueObservation?
    
    @objc dynamic var contact: ContactModel? {
        didSet {
            if let contact = contact {
                progressNeedsUpdating()
                
                propertyObservation = contact.observe(\.countDown) { observed, change in
                    self.progressNeedsUpdating()
                }
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        contact = ContactModel()
        contact?.countDown = 50
    }
    
    func progressNeedsUpdating() {
        if let count = contact?.countDown {
            let adjustedCount = (50.0 + Float(count)*2.0)/100.0
            progress = adjustedCount
        } else {
            progress = 0.0
        }
        
        if let countDown = contact?.countDown {
            if (countDown <= 0) {
                tintColor = MyVCStylekit.pastDueColor
            } else if (countDown <= 3) {
                tintColor = MyVCStylekit.warningColor
            } else {
                tintColor = MyVCStylekit.normalDueColor
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefaults()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDefaults()
    }
    
    func setupDefaults() {
        isOpaque = false
        translatesAutoresizingMaskIntoConstraints = false
        setupFont()
    }
    
    func setupFont() {
    }
    
    
}
