//
//  ViewController.swift
//  ios-app
//
//  Created by Louis Shakya on 10/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getCategories()
    }


}

