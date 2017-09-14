//
//  MasterViewController.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/10/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var model: AppModel?
    var sortSelection = 0
    
    @IBOutlet var modelSource: ContactTableSource!
    @IBAction func sortOrderedChanged(_ sender: UISegmentedControl) {
        
        sortSelection = sender.selectedSegmentIndex
        updateSortAndReload()
    }
    
    func updateSortAndReload(){
        switch sortSelection {
        case 0:
            modelSource.objects = model?.contactsByFamilyName()
        case 1:
            modelSource.objects = model?.contactsByUpcoming()
        default:
            break
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            model = delegate.appModel
            modelSource.objects = model?.contactsByFamilyName()
        }
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        updateSortAndReload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
//        objects.insert(ContactModel(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let object = modelSource?.objects?[indexPath.row] {
                    let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                    controller.contact = object
                    controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
    }

}

