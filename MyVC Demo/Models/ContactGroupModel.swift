//
//  ContactGroupModel.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/10/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@objcMembers class ContactGroupModel : NSObject, Codable  {
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    @objc dynamic var name:String?
    @objc dynamic var hintColor:UIColor? = nil

}
