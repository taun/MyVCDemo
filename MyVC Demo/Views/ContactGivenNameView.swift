//
//  ContactGivenNameView.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/12/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ContactGivenNameView : UITextField {
    
    var propertyObservation: NSKeyValueObservation?
    
    @objc dynamic var contact: ContactModel? {
        didSet {
            textNeedsUpdating()
                
            if let contact = contact {
               propertyObservation = contact.observe(\.givenName) { observed, change in
                    self.textNeedsUpdating()
                }
            }
        }
    }
    
    func textNeedsUpdating() {
        self.text = contact?.givenName ?? ""
        self.setNeedsLayout()
        self.layoutIfNeeded()
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
        translatesAutoresizingMaskIntoConstraints = false
        isEnabled = false
        placeholder = "Given Name"
        textAlignment = .left
        setupFont()
    }
    
    func setupFont() {
        adjustsFontForContentSizeCategory = true
        font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
    }
}
