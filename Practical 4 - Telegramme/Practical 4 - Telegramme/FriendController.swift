//
//  FriendController.swift
//  Practical 4 - Telegramme
//
//  Created by MAD2_P03 on 21/11/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FriendController {
    
    func AddFriend(friend:Friend) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
        let plusfriend = NSManagedObject(entity: entity, insertInto: context)
        plusfriend.setValue(friend.Name, forKeyPath: "name")
        plusfriend.setValue(friend.profileImageName, forKey: "profileimagename")
        
        do {
            try context.save()
        } catch let error as NSError {
            print ("Could not save. \(error),\(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        let cdmessage = NSManagedObject(entity: entity, insertInto: context)
        cdmessage.setValue(message.Date, forKey: "date")
        cdmessage.setValue(message.isSender, forKey: "isSender")
        cdmessage.setValue(message.Text, forKey: "text")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.Name)
        
        do {
            let test = try context.fetch(fetchRequest)
            let cdfriend = test[0]
            
            // Relationship
            cdmessage.setValue(cdfriend, forKey: "friend")
            try context.save()
        }
        catch {
            print(error)
        }
    }
    
    func retrieveMessagesByFriend(friend:Friend) -> [Message] {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var messageList:[Message] = []
        
        let fetchRequest = NSFetchRequest<CDMessage>(entityName: "CDMessage")
        fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.Name)
        
        do {
            let list:[NSManagedObject] = try context.fetch(fetchRequest)
            for n in list {
                let d = n.value(forKeyPath: "date") as! Date
                let b = n.value(forKeyPath: "isSender") as! Bool
                let t = n.value(forKeyPath: "text") as! String
                print("\(d) \(b), \(t)")
                messageList.append(Message(date: d, issender: b, text: t))
            }
        }
        catch {
            print(error)
        }
        return messageList
    }
    
}
