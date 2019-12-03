//
//  Recipe.swift
//  CT Revision 2
//
//  Created by MAD2_P03 on 3/12/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import Foundation

class Recipe {
    var name:String?
    var preparationTime:Int16?
    
    init(name:String, preparationTime:Int16) {
        self.name = name
        self.preparationTime = preparationTime
    }
}
