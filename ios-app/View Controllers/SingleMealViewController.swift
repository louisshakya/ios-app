//
//  SingleMealViewController.swift
//  ios-app
//
//  Created by Louis Shakya on 10/28/21.
//

import UIKit

class SingleMealViewController: UIViewController, SingleMealModelDelegate {
    
    @IBOutlet weak var mealTitleLabel: UILabel!
    
    @IBOutlet weak var mealInstructionLabel: UILabel!
    
    @IBOutlet weak var mealIngredientLable: UILabel!
    
    @IBOutlet weak var mealMeasureLabel: UILabel!
    
    var singleMealModel = SingleMealModel()
    var singleMeal = [SingleMeal]()
    var categoryMeal:CategoryMeal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set itself as the delegate
        singleMealModel.delegate = self
        
        guard categoryMeal != nil else {
            return
        }
        
        singleMealModel.getData(categoryMeal!.idMeal!)
        
    }
    
    // MARK: - Single Meal Model Delegate
    
    func singleMealFetched(_ singleMeal: [SingleMeal]) {
        
        self.singleMeal = singleMeal
        
        // Set the title and instruction label
        for items in self.singleMeal {
            
            self.mealTitleLabel.text = items.strMeal
            self.mealInstructionLabel.text = items.strInstructions
            
        }
        
        // Create an ingredients array to store all the ingredients of the single meal
        var ingredients = [String]()
        ingredients.append(self.singleMeal[0].strIngredient1 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient2 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient3 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient4 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient5 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient6 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient7 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient8 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient9 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient10 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient11 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient12 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient13 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient14 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient15 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient16 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient17 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient18 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient19 ?? "")
        ingredients.append(self.singleMeal[0].strIngredient20 ?? "")
        
        // Filter the ingredients array to remove any nil or empty values
        ingredients = ingredients.filter({$0 != "" || $0 != " "})

        // Create a measures array to store all the measures of the single meal
        var measures = [String]()
        measures.append(self.singleMeal[0].strMeasure1 ?? "")
        measures.append(self.singleMeal[0].strMeasure2 ?? "")
        measures.append(self.singleMeal[0].strMeasure3 ?? "")
        measures.append(self.singleMeal[0].strMeasure4 ?? "")
        measures.append(self.singleMeal[0].strMeasure5 ?? "")
        measures.append(self.singleMeal[0].strMeasure6 ?? "")
        measures.append(self.singleMeal[0].strMeasure7 ?? "")
        measures.append(self.singleMeal[0].strMeasure8 ?? "")
        measures.append(self.singleMeal[0].strMeasure9 ?? "")
        measures.append(self.singleMeal[0].strMeasure10 ?? "")
        measures.append(self.singleMeal[0].strMeasure11 ?? "")
        measures.append(self.singleMeal[0].strMeasure12 ?? "")
        measures.append(self.singleMeal[0].strMeasure13 ?? "")
        measures.append(self.singleMeal[0].strMeasure14 ?? "")
        measures.append(self.singleMeal[0].strMeasure15 ?? "")
        measures.append(self.singleMeal[0].strMeasure16 ?? "")
        measures.append(self.singleMeal[0].strMeasure17 ?? "")
        measures.append(self.singleMeal[0].strMeasure18 ?? "")
        measures.append(self.singleMeal[0].strMeasure19 ?? "")
        measures.append(self.singleMeal[0].strMeasure20 ?? "")

        // Filter the measures array to remove any nil or empty values
        measures = measures.filter({$0 != "" || $0 != " "})

        // Set the ingredients and measure label seperated by "\n"
        self.mealIngredientLable.text = ingredients.joined(separator: "\n")
        self.mealMeasureLabel.text = measures.joined(separator: "\n")
        
    }
    
    

}
