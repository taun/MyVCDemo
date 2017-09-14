//
//  ContactModel.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/10/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@objcMembers class ContactModel : NSObject, Codable {
    
    private enum CodingKeys: String, CodingKey {
        case givenName
        case familyName
        case organizationName
        case note
        case phoneHome
        case phoneWork
        case emailHome
        case emailWork
        case thumbnailName
        case countDown
        case groups
    }

    static var countdownKey:String {
        return #keyPath(countDown)
    }
    
    static var familyNameKey:String {
        return #keyPath(familyName)
    }
        
    override init() {
        countDown = 0
        groups = [String]()
        
        super.init()
    }
    
    @objc dynamic var givenName:String?
    @objc dynamic var familyName:String?
    @objc dynamic var organizationName:String?
    @objc dynamic var note:String?
    @objc dynamic var phoneHome:String?
    @objc dynamic var phoneWork:String?
    @objc dynamic var emailHome:String?
    @objc dynamic var emailWork:String?
    @objc dynamic var nextContactDate:Date? = nil
    @objc dynamic var countDown:Int
    @objc dynamic var groups:[String]
    @objc dynamic var thumbnailName:String?
    @objc dynamic var thumbnailImage:UIImage? = nil
}

