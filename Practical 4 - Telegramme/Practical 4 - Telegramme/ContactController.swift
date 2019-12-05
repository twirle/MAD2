//
//  ContactController.swift
//  Practical 4 - Telegramme
//
//  Created by MAD2_P03 on 19/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit
import CoreData

// Contact CRUD
class ContactController {
    func AddContact(newContact:Contact) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        let person = NSManagedObject(entity: entity, insertInto: context)
        person.setValue(newContact.firstName, forKeyPath: "firstname")
        person.setValue(newContact.lastName, forKeyPath: "lastname")
        person.setValue(newContact.mobileNo, forKeyPath: "mobileno")
        
        do {
            try context.save()
        } catch let error as NSError {
            print ("Could not save. \(error),\(error.userInfo)")
        }
    }
    
    func retrieveAllContact() -> [Contact] {
        var contact:[NSManagedObject] = []
        var contactList: [Contact] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do {
            contact = try context.fetch(fetchRequest)
            for c in contact {
                let firstname = c.value(forKeyPath: "firstname") as? String
                let lastname = c.value(forKeyPath: "lastname") as? String
                let mobileno = c.value(forKeyPath: "mobileno") as? String
                contactList.append(Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!))
                print("\(firstname!) \(lastname!), \(mobileno!)")
            }
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return contactList
    }
    
    func updateContact(mobileno:String, newContact:Contact) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
//        var contact : [NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
        do {
            let contact = try context.fetch(fetchRequest)
//            for c in contact {
//                if (c.value(forKeyPath: mobileno) as! String == mobileno) {
//                    c.setValue(newContact.firstName, forKey: "firstname")
//                    c.setValue(newContact.lastName, forKey: "lastname")
//                    c.setValue(newContact.mobileNo, forKey: "mobileno")
            let objectUpdate = contact[0]
            objectUpdate.setValue(newContact.firstName, forKey: "firstname")
            objectUpdate.setValue(newContact.lastName, forKey: "lastname")
            objectUpdate.setValue(newContact.mobileNo, forKey: "mobileno")
            do {
                try context.save()
                }
            }
            catch let error as NSError {
            print("Can't save. \(error)")
        }
    }
    
    func deleteContact (mobileno:String) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
        
        do {
            let del = try context.fetch(fetchRequest)
            
            let objectToDelete = del[0]
            context.delete(objectToDelete)
        
            do {
            try context.save()
            }
            catch {
            print("Can't save. \(error)")
            }
        }
        catch {
        print("Can't save. \(error)")
        }
    }
}
