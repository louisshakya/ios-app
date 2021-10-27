//
//  Categories.swift
//  ios-app
//
//  Created by Louis Shakya on 10/20/21.
//

import Foundation

struct Categories : Decodable {
    
    var idCategory:String?
    var strCategory:String?
    var strCategoryThumb:String?
    var strCategoryDescription:String?
    
    enum CodingKeys: String, CodingKey {
        
        case idCategory
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
    
    // Decoding instruction on how to map the JSON keyvalue pairs into the properties
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse idCategory
        self.idCategory = try container.decode(String.self, forKey: .idCategory)
        
        // Parse strCategory
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        
        // Parse strCategoryThumb
        self.strCategoryThumb = try container.decode(String.self, forKey: .strCategoryThumb)
        
        // Parese strCategoryDescription
        self.strCategoryDescription = try container.decode(String.self, forKey: .strCategoryDescription)
        
        
        
    }
    
}
