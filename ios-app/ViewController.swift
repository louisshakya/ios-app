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
        // Do any additional setup after loading the view.
        
        // Set itself as the dataSource
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model 
        model.delegate = self
        
        model.getCategories()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CATEGORYCELL_ID, for: indexPath)
        
        // Configure the cell with the data
        // Get the title for the category
        let title = self.categories[indexPath.row].strCategory
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    // delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}

