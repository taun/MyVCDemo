
//  ContactFullName.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/13/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ContactFullNameView : UITextField {
    
    var givenNameView: ContactGivenNameView?
    var familyNameView: ContactFamilyNameView?
    var lastBounds: CGRect = CGRect.zero
    
    @objc dynamic var contact: ContactModel? {
        didSet {
            viewsNeedUpdating()
        }
    }
    
    func viewsNeedUpdating() {
        if let givenNameView = givenNameView {
            givenNameView.contact = contact
        }
        if let familyNameView = familyNameView {
            familyNameView.contact = contact
        }
        setNeedsLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefaults()
        setupSubviews()
   }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDefaults()
        setupSubviews()
    }
    
    func setupDefaults() {
        self.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    func setupSubviews() {
        givenNameView = ContactGivenNameView(frame: CGRect.zero)
        addSubview(givenNameView!)
        familyNameView = ContactFamilyNameView(frame: CGRect.zero)
        addSubview(familyNameView!)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        
        lastBounds = bounds
        super.updateConstraints()

        
        if let familyNameView = familyNameView, let givenNameView = givenNameView {
            
            familyNameView.firstBaselineAnchor.constraint(equalTo: givenNameView.firstBaselineAnchor).isActive = true
            givenNameView.leadingAnchor.constraintEqualToSystemSpacingAfter(familyNameView.trailingAnchor, multiplier: 1.0).isActive = true
            leadingAnchor.constraint(equalTo: familyNameView.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: givenNameView.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: givenNameView.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: givenNameView.bottomAnchor).isActive = true
        }
}
    
    override func layoutSubviews() {
        if lastBounds != bounds {
            setNeedsUpdateConstraints()
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
}
