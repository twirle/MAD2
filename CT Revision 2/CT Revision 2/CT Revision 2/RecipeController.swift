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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)
                
        let cdIngredient = NSManagedObject(entity: entity!, insertInto: context) as! CDIngredient
                
        // Fetch CDIngredient
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name!)
        
        // Check if ingredient exist
        cdIngredient.name = ingredient.name
        
        // Adding to recipe
        do {
            let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
            cdIngredient.addToRecipes(cdRecipe[0])
        }
        catch {print(error)}
        
        appDelegate.saveContext()
    }
    
    func RetrieveRecipe()->[Recipe] {
        
        var recipeList:[Recipe] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        do{
            let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
            for r in cdRecipe{
                recipeList.append(Recipe(name: r.name!, preparationTime: r.preparationTime))
            }
        }
        catch {print(error)}
        
        return recipeList
    }
    
    func RetrieveIngredientFromRecipe(recipe:Recipe)->[Ingredient] {
        var ingredientList:[Ingredient] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        fetchRequest.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name!)
        
        do {
            let cdIngredient = try context.fetch(fetchRequest) as! [CDIngredient]
            for ing in cdIngredient{
                ingredientList.append(Ingredient(name: ing.name!))
            }
        }
        catch {print(error)}
        
        return ingredientList
    }
    
    
}
	
