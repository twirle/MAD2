//
//  RecipeTableViewController.swift
//  CT Revision 2
//
//  Created by MAD2_P03 on 3/12/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableViewController : UITableViewController {
    
    var recipeList:[Recipe] = []
    var ingredientList:[Ingredient] = []
    let recipeController:RecipeController = RecipeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //recipeList = recipeController.RetrieveRecipe()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        recipeList = recipeController.RetrieveRecipe()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        ingredientList = recipeController.RetrieveIngredientFromRecipe(recipe: recipeList[indexPath.row])
        
        var s:String = ""
        for ing in ingredientList {
            s += ing.name! + ","
        }
        
        cell.textLabel!.text = recipeList[indexPath.row].name!
        cell.detailTextLabel!.text = s
        
        return cell
    }
}
