//
//  MealViewController.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CategoryModelDelegate {
    
    @IBOutlet weak var categoryMealTableView: UITableView!
    
    @IBOutlet weak var selectedCategoryTitle: UILabel!
    
    var categoryMealsModel = CategoryModel()
    var categoryMeals = [CategoryMeal]()
    var category:Categories?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the dataSource and delegate
        categoryMealTableView.dataSource = self
        categoryMealTableView.delegate = self
        
        // Set itself as the delegate of the categorymeal model
        categoryMealsModel.delegate = self
        
        guard category != nil else {
            return
        }
        
        self.selectedCategoryTitle.text = category!.strCategory!
        
        categoryMealsModel.getData(category!.strCategory!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check for the segue called
        if (segue.identifier == "mealsListToMeal") {
            
            // Confirm that a category was selected
            guard categoryMealTableView.indexPathForSelectedRow != nil else {
                return
            }
            
            // Get a reference to the category that was tapped on
            let selectedCategoryMeal = categoryMeals[categoryMealTableView.indexPathForSelectedRow!.row]
            
            // Get a reference to the meal view controller
            let mealVC = segue.destination as! SingleMealViewController
            
            // Set the category property of the meal view controller
            mealVC.categoryMeal = selectedCategoryMeal
            
        }
    }
    
    // MARK: - category model delegate methods
    func categoryMealsFetched(_ categoryMeals: [CategoryMeal]) {
        
        // Set the returned category meals to our category meal property
        self.categoryMeals = categoryMeals
        
        // Sort categoryMeals in ascending order
        self.categoryMeals = self.categoryMeals.sorted(by: {$0.strMeal! < $1.strMeal!})
        
        // Refresh the tableview
        categoryMealTableView.reloadData()
        
    }
    
    
    // MARK: - tableView methods
    
    // dataSource methods
    
    // How many rows to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryMeals.count
    }
    
    // What data to display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = categoryMealTableView.dequeueReusableCell(withIdentifier: Constants.CATEGORYMEALCELL_ID, for: indexPath) as! CategoryMealTableViewCell
        
        // Configure the cell with the data
        let categoryMeals = self.categoryMeals[indexPath.row]
        
        cell.setCell(categoryMeals)
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
