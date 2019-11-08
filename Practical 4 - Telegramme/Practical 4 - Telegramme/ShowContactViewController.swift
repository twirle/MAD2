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
        
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            //1. remove data from model
            appDelegate.contactList.remove(at: indexPath.row)

            //2. remove row from view
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)

            //3. custom method to update your view after removing
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let vc = segue.destination as? EditContactViewController,
            let tableIndex = tableView.indexPathForSelectedRow?.row {
            vc.editFirstNameFld.text = appDelegate.contactList[tableIndex].firstName
            vc.editLastNameFld.text = appDelegate.contactList[tableIndex].lastName
            vc.editMobileFld.text = appDelegate.contactList[tableIndex].mobileNo
        }
    }


}
