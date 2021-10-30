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
        
        print("i am inside single meal model get data")
        
        let singleMealURL = Constants.SINGLE_MEAL_API_URL + mealID
        
        print(singleMealURL)
        
        let url = URL(string: singleMealURL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            print("creating data task")
            if error != nil && data == nil {
                print("An error occured while fetching data")
            }
            
            do {
                
                let decoder = JSONDecoder()
                let response = try decoder.decode(MealResponse.self, from: data!)
                print("created response")
                if response.meals != nil {
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.singleMealFetched(response.meals!)
                        
                    }
                    
                }

            }
            catch {
            }
            
            
            
        }
        dataTask.resume()
    }
    
}
