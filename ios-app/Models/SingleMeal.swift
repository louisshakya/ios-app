//
//  Meals.swift
//  ios-app
//
//  Created by Louis Shakya on 10/28/21.
//

import Foundation

struct SingleMeal : Decodable {
    
    var strMeal:String?
    var strInstructions:String?
    
    var strIngredient1:String?
    var strIngredient2:String?
    var strIngredient3:String?
    var strIngredient4:String?
    var strIngredient5:String?
    var strIngredient6:String?
    var strIngredient7:String?
    var strIngredient8:String?
    var strIngredient9:String?
    var strIngredient10:String?
    var strIngredient11:String?
    var strIngredient12:String?
    var strIngredient13:String?
    var strIngredient14:String?
    var strIngredient15:String?
    var strIngredient16:String?
    var strIngredient17:String?
    var strIngredient18:String?
    var strIngredient19:String?
    var strIngredient20:String?
    
    var strMeasure1:String?
    var strMeasure2:String?
    var strMeasure3:String?
    var strMeasure4:String?
    var strMeasure5:String?
    var strMeasure6:String?
    var strMeasure7:String?
    var strMeasure8:String?
    var strMeasure9:String?
    var strMeasure10:String?
    var strMeasure11:String?
    var strMeasure12:String?
    var strMeasure13:String?
    var strMeasure14:String?
    var strMeasure15:String?
    var strMeasure16:String?
    var strMeasure17:String?
    var strMeasure18:String?
    var strMeasure19:String?
    var strMeasure20:String?
    
    enum CodingKeys: String, CodingKey {
        
        case strMeal
        case strInstructions
        
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parsing strMeal and strInstruction
        self.strMeal = try? container.decode(String.self, forKey: .strMeal)
        
        self.strInstructions = try? container.decode(String.self, forKey: .strInstructions)
        
        // Parsing strIngredients
        self.strIngredient1 = try? container.decode(String.self, forKey: .strIngredient1)
        self.strIngredient2 = try? container.decode(String.self, forKey: .strIngredient2)
        self.strIngredient3 = try? container.decode(String.self, forKey: .strIngredient3)
        self.strIngredient4 = try? container.decode(String.self, forKey: .strIngredient4)
        self.strIngredient5 = try? container.decode(String.self, forKey: .strIngredient5)
        self.strIngredient6 = try? container.decode(String.self, forKey: .strIngredient6)
        self.strIngredient7 = try? container.decode(String.self, forKey: .strIngredient7)
        self.strIngredient8 = try? container.decode(String.self, forKey: .strIngredient8)
        self.strIngredient9 = try? container.decode(String.self, forKey: .strIngredient9)
        self.strIngredient10 = try? container.decode(String.self, forKey: .strIngredient10)
        self.strIngredient11 = try? container.decode(String.self, forKey: .strIngredient11)
        self.strIngredient12 = try? container.decode(String.self, forKey: .strIngredient12)
        self.strIngredient13 = try? container.decode(String.self, forKey: .strIngredient13)
        self.strIngredient14 = try? container.decode(String.self, forKey: .strIngredient14)
        self.strIngredient15 = try? container.decode(String.self, forKey: .strIngredient15)
        self.strIngredient16 = try? container.decode(String.self, forKey: .strIngredient16)
        self.strIngredient17 = try? container.decode(String.self, forKey: .strIngredient17)
        self.strIngredient18 = try? container.decode(String.self, forKey: .strIngredient18)
        self.strIngredient19 = try? container.decode(String.self, forKey: .strIngredient19)
        self.strIngredient20 = try? container.decode(String.self, forKey: .strIngredient20)
        
        // Parsing strMeasures
        self.strMeasure1 = try? container.decode(String.self, forKey: .strMeasure1)
        self.strMeasure2 = try? container.decode(String.self, forKey: .strMeasure2)
        self.strMeasure3 = try? container.decode(String.self, forKey: .strMeasure3)
        self.strMeasure4 = try? container.decode(String.self, forKey: .strMeasure4)
        self.strMeasure5 = try? container.decode(String.self, forKey: .strMeasure5)
        self.strMeasure6 = try? container.decode(String.self, forKey: .strMeasure6)
        self.strMeasure7 = try? container.decode(String.self, forKey: .strMeasure7)
        self.strMeasure8 = try? container.decode(String.self, forKey: .strMeasure8)
        self.strMeasure9 = try? container.decode(String.self, forKey: .strMeasure9)
        self.strMeasure10 = try? container.decode(String.self, forKey: .strMeasure10)
        self.strMeasure11 = try? container.decode(String.self, forKey: .strMeasure11)
        self.strMeasure12 = try? container.decode(String.self, forKey: .strMeasure12)
        self.strMeasure13 = try? container.decode(String.self, forKey: .strMeasure13)
        self.strMeasure14 = try? container.decode(String.self, forKey: .strMeasure14)
        self.strMeasure15 = try? container.decode(String.self, forKey: .strMeasure15)
        self.strMeasure16 = try? container.decode(String.self, forKey: .strMeasure16)
        self.strMeasure17 = try? container.decode(String.self, forKey: .strMeasure17)
        self.strMeasure18 = try? container.decode(String.self, forKey: .strMeasure18)
        self.strMeasure19 = try? container.decode(String.self, forKey: .strMeasure19)
        self.strMeasure20 = try? container.decode(String.self, forKey: .strMeasure20)
    
    }
    
    
}
