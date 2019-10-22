//
//  ViewController.swift
//  MAD2 Practical 2
//
//  Created by MAD2_P03 on 22/10/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var friendList:Array<Friend> = []
    
    func initFriends() {
        friendList.append(Friend(firstname: "Ale", lastname: "Coal", age: 10));
        friendList.append(Friend(firstname: "ble", lastname: "Coal", age: 10));
        friendList.append(Friend(firstname: "cle", lastname: "Coal", age: 10));
        friendList.append(Friend(firstname: "dle", lastname: "Coal", age: 10));
        friendList.append(Friend(firstname: "ele", lastname: "Coal", age: 10))
        
    }
    
    func displayFriends() {
        for friend in friendList{
            print(friend.firstName,friend.lastName,friend.age)
        }
    }
    
    func displayFriendsUnder20(){
        for friend in friendList{
            if friend.age < 20 {
               print(friend.firstName,friend.lastName,friend.age)
            }
        }
    }
    
    func findAverageAge()->Double {
        var sum:Int = 0
        for friend in friendList {
            sum += friend.age
        }
        return Double(sum / friendList.count)
    }
}

