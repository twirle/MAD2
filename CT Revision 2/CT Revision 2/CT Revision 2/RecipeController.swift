//
//  RecipeController.swift
//  CT Revision 2
//
//  Created by MAD2_P03 on 3/12/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeController {
    
    func AddRecipe(recipe:Recipe) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)

//        let cdRecipe = NSManagedObject(entity: entity!, insertInto: context)
//
//        cdRecipe.setValue(recipe.name, forKey: "name")
//        cdRecipe.setValue(preparationTime, forKey: "preparationTime")
        
        let cdRecipe = NSManagedObject(entity: entity!, insertInto: context) as! CDRecipe
        
        cdRecipe.name = recipe.name
        cdRecipe.preparationTime = recipe.preparationTime!
        
        appDelegate.saveContext()
        
    }
    
    func AddIngredientToRecipe(recipe:Recipe, ingredient:Ingredient) {
        
    }
    
    func RetrieveRecipe()->[Recipe] {
        
        var recipeList:[Recipe] = []
        return recipeList
    }
    
    func RetrieveIngredientFromRecipe(recipe:Recipe)->[Ingredient] {
        var ingredientList:[Ingredient] = []
        return ingredientList
    }
    
    
}
