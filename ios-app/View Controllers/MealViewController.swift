//
//  MealViewController.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CategoryModelDelegate {
    
    @IBOutlet weak var categoryMealTableView: UITableView!
    
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
        
        categoryMealsModel.getData(category!.strCategory!)
    }

    
    // MARK: - category model delegate methods
    func categoryMealsFetched(_ categoryMeals: [CategoryMeal]) {
        
        // Set the returned category meals to our category meal property
        self.categoryMeals = categoryMeals
        
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
        
        let categoryMeals = self.categoryMeals[indexPath.row]
        
        cell.setCell(categoryMeals)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
