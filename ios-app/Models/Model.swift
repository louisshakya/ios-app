//
//  Model.swift
//  ios-app
//
//  Created by Louis Shakya on 10/15/21.
//

import Foundation

protocol ModelDelegate {
    func categoriesFetched(_ categories:[Categories])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getData() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                print("an error occured while fetching data")
                return
            }
            
            do {
                
                // Parsing the data into image objetcs
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.categories != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call the "categoriesFetched" method of the delegate
                        self.delegate?.categoriesFetched(response.categories!)
                    }
                }
            }
            catch {
            }
            
        }
        
        // Make the API Call, Kick off the task
        dataTask.resume()
        
    }
}
