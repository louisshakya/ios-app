//
//  ViewController.swift
//  ios-app
//
//  Created by Louis Shakya on 10/15/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var categories = [Categories]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set itself as the dataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model 
        model.delegate = self
        
        model.getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "categoriesToMealsList") {
            
        // Confirm that a category was selected
            guard tableView.indexPathForSelectedRow != nil else {
                return
            }
            
            // Get a reference to the category that was tapped on
            let selectedCategory = categories[tableView.indexPathForSelectedRow!.row]
            
            // Get a reference to the meal view controller
            let categoryMealVC = segue.destination as! MealViewController
            
            // Set the category property of the meal view controller
            categoryMealVC.category = selectedCategory
            
        }
    }
    
    // MARK: - model delegate methods
    
    func categoriesFetched(_ categories: [Categories]) {
        
        // Set the returned categories to our categories property
        self.categories = categories
        
        // Refresh the tableview
        tableView.reloadData()
    }

    // MARK: - tableView Methods
    
    
    // dataSource methods
    
    // How many rows to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    // What data to display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CATEGORYCELL_ID, for: indexPath) as! CategoryTableViewCell
        
        // Configure the cell with the data
        // Get the title for the category
        let category = self.categories[indexPath.row]
        
        cell.setCell(category)
        
        // Return the cell
        return cell
    }
    
    // delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}

