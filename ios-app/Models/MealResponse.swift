//
//  MealResponse.swift
//  ios-app
//
//  Created by Louis Shakya on 10/28/21.
//

import Foundation

struct MealResponse: Decodable {
    
    var meals:[SingleMeal]?
    
    enum CodingKeys: String, CodingKey {
        
        case meals
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.meals = try container.decode([SingleMeal].self, forKey: .meals)
        
    }
    
}
