//
//  SingleMealModel.swift
//  ios-app
//
//  Created by Louis Shakya on 10/28/21.
//

import Foundation

class SingleMealModel {
    
    func getData(_ mealID: String) {
        
        let singleMealURL = Constants.SINGLE_MEAL_API_URL + mealID
        
        let url = URL(string: singleMealURL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error != nil && data == nil {
                print("An error occured while fetching data")
            }
            
            do {
                
                let decoder = JSONDecoder()
                let response = try decoder.decode(MealResponse.self, from: data!)
                print("i am an error wooooo")
                dump(response)

            }
            catch {
            }
            
            
            
        }
        dataTask.resume()
    }
    
}
