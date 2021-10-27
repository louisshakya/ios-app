//
//  Response.swift
//  ios-app
//
//  Created by Louis Shakya on 10/23/21.
//

import Foundation

struct Response: Decodable {
    
    var categories:[Categories]?
    
    enum CodingKeys:String, CodingKey {
        
        case categories
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse categories
        self.categories = try container.decode([Categories].self, forKey: .categories)
        
    }
}
