//
//  ContactCountDownView.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/13/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ContactCountDownView : UILabel {
    
    var propertyObservation: NSKeyValueObservation?
    
    @objc dynamic var contact: ContactModel? {
        didSet {
            if let contact = contact {
                textNeedsUpdating()
                
                propertyObservation = contact.observe(\.countDown) { observed, change in
                    self.textNeedsUpdating()
                }
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        contact = ContactModel()
        contact?.countDown = -5
    }

    func textNeedsUpdating() {
        text = "\(contact?.countDown ?? 0)"
        
        var weight = UIFont.Weight.thin
        if let countDown = contact?.countDown {
            if (countDown <= 0) {
                textColor = MyVCStylekit.pastDueColor
                weight = UIFont.Weight.bold
            } else if (countDown <= 3) {
                textColor = MyVCStylekit.warningColor
                weight = UIFont.Weight.heavy;
            } else {
                textColor = MyVCStylekit.normalDueColor
                weight = UIFont.Weight.thin;
            }
            
            font = UIFont.systemFont(ofSize: 17.0, weight: weight)
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
        textAlignment = .center
        setupFont()
    }
    
    func setupFont() {
        adjustsFontForContentSizeCategory = true
    }


}
