//
//  QRScannerViewController.swift
//  Practical 6
//
//  Created by MAD2_P03 on 28/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import QRCodeReader

class QRScannerViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
      reader.stopScanning()

      dismiss(animated: true, completion: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()

    @IBAction func scanAction(_ sender: AnyObject) {
      // Retrieve the QRCode content
      // By using the delegate pattern
      readerVC.delegate = self

      // Or by using the closure pattern
      readerVC.completionBlock = { (result: QRCodeReaderResult?) in
        print(result!)
        
        DispatchQueue.main.async {
            let s = String(result!.value)
            self.AlertMe(message: s)
        }
      }

      // Presents the readerVC as modal form sheet
      readerVC.modalPresentationStyle = .formSheet
     
      present(readerVC, animated: true, completion: nil)
    }
    
    
    func AlertMe(message:String){
        let a = UIAlertController(title: "Application", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
        let action2 = UIAlertAction(title: "Submit", style: .default, handler: nil )
    
    
        a.addAction(action1)
        a.addAction(action2)
    
        present(a, animated: true, completion: nil)
    }
}
