//
//  DetailViewController.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/10/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var contactView: ContactFullNameView?
    @IBOutlet weak var contactCountDownView: ContactCountDownView?
    @IBOutlet weak var stepper: UIStepper?
    
    func configureView() {
        // Update the user interface for the detail item.
        stepper?.isHidden = true
        
        if let contact = contact, let contactView = contactView {
            contactView.contact = contact
            contactCountDownView?.contact = contact
            stepper?.value = Double(contact.countDown)
            stepper?.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var contact: ContactModel? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBAction func changeCountDown(_ sender: UIStepper) {
        contact?.countDown = Int(sender.value)
    }
    
}

