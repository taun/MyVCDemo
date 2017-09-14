//
//  ContactFamilyName.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/13/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ContactFamilyNameView : UITextField {
    
    var propertyObservation: NSKeyValueObservation?
    
    @objc dynamic var contact: ContactModel? {
        didSet {
            textNeedsUpdating()
                
            if let contact = contact {
                propertyObservation = contact.observe(\.familyName) { observed, change in
                    self.textNeedsUpdating()
                }
            }
        }
    }
    
    func textNeedsUpdating() {
        self.text = contact?.familyName ?? ""
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
        isEnabled = false
        placeholder = "Family Name"
        textAlignment = .left
        setupFont()
    }
    
    func setupFont() {
        adjustsFontForContentSizeCategory = true
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.headline)
        let boldFontDescriptor = fontDescriptor.withSymbolicTraits(.traitBold)
        if let boldFontDescriptor = boldFontDescriptor {
            font = UIFont(descriptor: boldFontDescriptor, size: 0.0)
        } else {
            font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        }
        
    }
}
