//
//  AppModel.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/10/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation

class AppModel {
    
    private var contacts:[ContactModel]?
    
    // next static sort descriptor
    class func countdownSortDescriptor() -> NSSortDescriptor {
        return NSSortDescriptor()
    }
    
    class func familyNameSortDescriptor() -> NSSortDescriptor {
        return NSSortDescriptor()
    }
    
    init() {
        
        loadContactPlist()
    }

    func loadContactPlist()  {
        if let url = Bundle.main.url(forResource:"DemoContacts", withExtension: "plist") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                contacts = try decoder.decode([ContactModel].self, from: data)
            } catch {
                // Handle error
                print(error)
            }
        }
    }
    
    func contactsByUpcoming() -> [ContactModel]? {
        return contacts?.sorted(by: { (one, two) -> Bool in
            one.countDown < two.countDown
        })
    }
    
    func contactsByFamilyName() -> [ContactModel]? {
        return contacts?.sorted(by: { (one, two) -> Bool in
            one.familyName?.localizedCaseInsensitiveCompare(two.familyName ?? "") == ComparisonResult.orderedAscending
        })
    }
}
