//
//  ViewController.swift
//  Practical 3
//
//  Created by MAD2_P03 on 29/10/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBAction func onClick(_ sender: AnyObject) {
        print("I'm clicked!")
        myLbl.text = ("I'm clicked!")
    }
    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        myLbl.text = textField.text
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //txtField.delegate = self   //delegating programmatically
        
    }

    
    
    

}



