//
//  SingleMealViewController.swift
//  ios-app
//
//  Created by Louis Shakya on 10/28/21.
//

import UIKit

class SingleMealViewController: UIViewController {
    
    var singleMealModel = SingleMealModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        singleMealModel.getData("52874")
    }

}
