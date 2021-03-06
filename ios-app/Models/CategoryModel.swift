//
//  CategoryModel.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import Foundation

// Protocol for CategoryModel
protocol CategoryModelDelegate {
    func  categoryMealsFetched(_ categoryMeals:[CategoryMeal])
}

class CategoryModel {
    
    var delegate:CategoryModelDelegate?
    
    func getData(_ categoryTitle:String) {
        
        // Create new url containing the category title to access the end point of the api
        let categoryMealURL = Constants.CATEGORY_MEAL_API_URL + categoryTitle
        
        // Create URL Object
        let url = URL(string: categoryMealURL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check if there were any errors
            if error != nil || data == nil {
                print("an error occured while fetching data")
                return
            }

            do {

                // Parsing the data into categoryMeals objects
                let decoder = JSONDecoder()
                let response = try decoder.decode(CategoryResponse.self, from: data!)
                
                if response.meals != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call the "categoriesFetched" method of the delegate
                        self.delegate?.categoryMealsFetched(response.meals!)
                    }
                }
            }
            catch {
                print("Error occurred while parsing data")
            }
        }
        
        // Make the API Call, Kick off the task
        dataTask.resume()
        
    }
    
}
