//
//  ContactTableSource.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/13/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

class ContactTableSource: NSObject {
    
    var objects:[ContactModel]?
        
}

extension ContactTableSource: UITableViewDataSource {

    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        if let object = objects?[indexPath.row], let contactCell = cell as? ContactTableCell {
            contactCell.contact = object
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
