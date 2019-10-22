//
//  Friend.swift
//  MAD2 Practical 2
//
//  Created by MAD2_P03 on 22/10/19.
//  Copyright © 2019 Shin. All rights reserved.
//


import Foundation

class Friend {
    var firstName: String = ""
    var lastName: String = ""
    var age:Int = 0
    var description:String = ""
    
    init(firstname:String, lastname:String, age:Int) {
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
    }
}
