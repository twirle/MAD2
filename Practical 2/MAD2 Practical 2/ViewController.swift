//
//  ViewController.swift
//  MAD2 Practical 2
//
//  Created by MAD2_P03 on 22/10/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtFriend: UILabel!
    
    var friendList:Array<Friend> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initFriends()
        displayFriendsUnder20()
        findAverageAge()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
    }
    

    func initFriends() {
        friendList.append(Friend(firstname: "Ale", lastname: "Coal", age: 15));
        friendList.append(Friend(firstname: "Billy", lastname: "Coal", age: 12));
        friendList.append(Friend(firstname: "Clear", lastname: "Coal", age: 13));
        friendList.append(Friend(firstname: "Del", lastname: "Coal", age: 11));
        friendList.append(Friend(firstname: "Elle", lastname: "Coal", age: 10))
    }
    
    func displayFriends() {
        txtFriend.text = ""
        for friend in friendList{
            print("\(friend.firstName) \(friend.lastName) \(friend.age)")
            txtFriend.text = txtFriend.text! + "\(friend.firstName) \(friend.lastName), \(friend.age)" + "\n"
            
        }
    }
    
    func displayFriendsUnder20(){
        for friend in friendList{
            if friend.age < 20 {
               print("\(friend.firstName) \(friend.lastName) is underage.")
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
    @IBAction func btnClick(_ sender: Any) {
        displayFriends();
    }
}

