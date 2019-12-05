//
//  ShowContactViewController.swift
//  Practical 4 - Telegramme
//
//  Created by MAD2_P03 on 7/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit

class ShowContactViewController: UITableViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for:indexPath)
        
//        let contact = appDelegate.contactList[indexPath.row]
        let controller = ContactController()
        let contact = controller.retrieveAllContact()[indexPath.row]
        print(contact)
        
        
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            //1. remove data from model
//            appDelegate.contactList.remove(at: indexPath.row)
            let controller = ContactController()
            let contactList = controller.retrieveAllContact()
            let contact = contactList[indexPath.row]
            controller.deleteContact(mobileno: contact.mobileNo)
            

//            //2. remove row from view
//            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)

            //3. custom method to update your view after removing
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ContactController()
        let contactList = controller.retrieveAllContact()
        
        //let alert = UIAlertController(title: "Edit Contact", message: "", preferredStyle: UIAlertController.Style.alert)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        if let vc = segue.destination as? EditContactViewController,
//            let tableIndex = tableView.indexPathForSelectedRow?.row {
//            performSegue(withIdentifier: EditSegue, sender: self)
//        }
//    }


}
