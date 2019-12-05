//
//  AddContactViewController.swift
//  Practical 4 - Telegramme
//
//  Created by MAD2_P03 on 7/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit


class AddContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func createBtn(_ sender: Any) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.contactList.append(Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!))
        
        let cController = ContactController()
        cController.AddContact(newContact:Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!))
        
    }
}
