//
//  SingleMealModel.swift
//  ios-app
//
//  Created by Louis Shakya on 10/28/21.
//

import Foundation

protocol SingleMealModelDelegate {
    func singleMealFetched(_ singleMeal:[SingleMeal])
}


class SingleMealModel {
    
    var delegate:SingleMealModelDelegate?
    
    func getData(_ mealID: String) {
        
        // Create a new url containing mealID to access the end point of the api
        let singleMealURL = Constants.SINGLE_MEAL_API_URL + mealID
        
        // Create a URL object
        let url = URL(string: singleMealURL)
        
        guard url != nil else {
            return
        }
        
        // Create a URLSession object
        let session = URLSession.shared
        
        // Create a dataTask from the URLSession
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
           // Check if there were any errors
            if error != nil && data == nil {
                print("An error occured while fetching data")
            }
            
            do {
                
                // Parsing the data into singleMeal object
                let decoder = JSONDecoder()
                let response = try decoder.decode(MealResponse.self, from: data!)
                
                if response.meals != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call "singleMealFetched" method of the delegate
                        self.delegate?.singleMealFetched(response.meals!)
                        
                    }
                }
            }
            catch {
                print("Error occured while parsing data")
            }
        }
        
        // Make api call/ kick off data task
        dataTask.resume()
    }
    
}
