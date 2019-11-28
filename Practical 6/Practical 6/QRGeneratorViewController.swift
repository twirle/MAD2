//
//  QRGeneratorViewController.swift
//  Practical 6
//
//  Created by MAD2_P03 on 28/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import Foundation
import UIKit
import QRCode

class QRGeneratorViewController: UIViewController, UITextFieldDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textFld: UITextField!
    @IBOutlet weak var QRView: UIImageView!
    
    func textFieldShouldReturn(_ textField:UITextField)-> Bool{
        
        let qrcode = QRCode(textFld.text!)
        QRView.image = qrcode?.image
        
        return true
    }
    
}
