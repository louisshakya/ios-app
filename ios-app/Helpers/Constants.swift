//
//  Constants.swift
//  ios-app
//
//  Created by Louis Shakya on 10/15/21.
//

import Foundation

struct Constants {
    static var API_KEY = "1"
    static var API_URL = "https://www.themealdb.com/api/json/v1/\(Constants.API_KEY)/categories.php"
    static var CATEGORY_MEAL_API_URL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    
    static var CATEGORYCELL_ID = "CategoryCell"
    static var CATEGORYMEALCELL_ID = "CategoryMealCell"
}
