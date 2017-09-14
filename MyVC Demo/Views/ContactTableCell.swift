//
//  ContactTableCell.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/13/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class ContactTableCell: UITableViewCell  {
    
    var lastBounds: CGRect = CGRect.zero

    @IBOutlet weak var contactView: ContactFullNameView!
    @IBOutlet weak var contactCountDownView: ContactCountDownView!
    @IBOutlet weak var contactCountDownProgressView: ContactCountDownProgressView!
    
    @objc dynamic var contact: ContactModel? {
        didSet {
            viewsNeedUpdating()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDefaults()
    }

    func setupDefaults() {
    }
    
    func viewsNeedUpdating() {
        contactView?.contact = contact
        contactCountDownView?.contact = contact
        contactCountDownProgressView?.contact = contact
        setNeedsLayout()
    }

    override func prepareForReuse() {
        contact = nil
    }
}
