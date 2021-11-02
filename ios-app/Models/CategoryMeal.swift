//
//  CategoryMeal.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import Foundation

struct CategoryMeal : Decodable {
        
    var strMeal:String?
    var strMealThumb:String?
    var idMeal:String?
    
    enum CodingKeys: String, CodingKey {
        
        case strMeal
        case strMealThumb
        case idMeal
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse strMeal
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        
        // Parse strMealthumb
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        
        // Parse idMeal
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        
    }
    
}
