//
//  EditContactViewController.swift
//  Practical 4 - Telegramme
//
//  Created by MAD2_P03 on 7/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit


class EditContactViewController: UIViewController {
    
    @IBOutlet weak var editFirstNameFld: UITextField!
    @IBOutlet weak var editLastNameFld: UITextField!
    @IBOutlet weak var editMobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        
        _ = navigationController?.popViewController(animated: true)

    }
    
    
}
