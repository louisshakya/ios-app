//
//  CategoryModel.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import Foundation

class CategoryModel {
    
    func getData() {
        
        let url = URL(string: Constants.CATEGORY_MEAL_API_URL+"beef")
        
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

                // Parsing the data into image objects
                let decoder = JSONDecoder()
                let response = try decoder.decode(CategoryResponse.self, from: data!)
                
                dump(response)
                
            }
            catch {
            }

            
            
        }
        
        // Make the API Call, Kick off the task
        dataTask.resume()
        
    }
    
}
