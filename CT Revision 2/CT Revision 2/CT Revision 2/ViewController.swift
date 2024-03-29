//
//  ViewController.swift
//  CT Revision 2
//
//  Created by MAD2_P03 on 3/12/19.
//  Copyright © 2019 Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRecipeName: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredients1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AppDelegate.temp = Recipe(name: "Apple Pie", preparationTime: 5)
    }
    
    
    let recipeController:RecipeController = RecipeController()

    @IBAction func btnAdd(_ sender: UIButton) {
        let recipe:Recipe = Recipe(name: txtRecipeName.text!, preparationTime: Int16(txtPreparationTime.text!)!)
        let ingredient1:Ingredient = Ingredient(name: txtIngredients1.text!)
        
        
        let alertView = UIAlertController(title: "Confirm", message: "Do you want to add this recipe?", preferredStyle: UIAlertController.Style.alert)
        
        alertView.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {_ in
            print(ingredient1.name!)
            
        }))
        alertView.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alertView, animated: true, completion: nil)
        
        recipeController.AddRecipe(recipe: recipe)
        recipeController.AddIngredientToRecipe(recipe:recipe, ingredient:ingredient1)
    }
}
