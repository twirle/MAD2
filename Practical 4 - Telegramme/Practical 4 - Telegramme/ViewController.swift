//
//  ViewController.swift
//  Practical 4 - Telegramme
//
//  Created by MAD2_P03 on 5/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usrNameFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: Any) {
        if true { // if username and password is correct}
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc, animated: true, completion: nil)
        }
    }
}

