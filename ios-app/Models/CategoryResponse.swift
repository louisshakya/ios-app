//
//  CategoryResponse.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import Foundation

struct CategoryResponse: Decodable {
    
    var meals: [CategoryMeal]?
    
    enum CodingKeys: String, CodingKey {
        
        case meals
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self )
        
        // Parse meals
        self.meals = try container.decode([CategoryMeal].self, forKey: .meals)
    }
    
}
