//
//  CategoryMealTableViewCell.swift
//  ios-app
//
//  Created by Louis Shakya on 10/26/21.
//

import UIKit

class CategoryMealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryMealLabel: UILabel!
    
    @IBOutlet weak var categoryMealImageView: UIImageView!
    
    var categorymeals:CategoryMeal?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // Create a setCell function
    func setCell(_ c:CategoryMeal) {
        
        self.categorymeals = c
        
        // Ensure that we have a category Meal
        guard self.categorymeals != nil else {
            return
        }
        
        // Set the title
        self.categoryMealLabel.text = categorymeals?.strMeal

        // Set the thumbnail
        guard self.categorymeals?.strMealThumb != nil else {
            return
        }
        
        // Create a URL object
        let url = URL(string: self.categorymeals!.strMealThumb!)
        
        // Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTaks = session.dataTask(with: url!) { data, response, error in
            
            // Check if there were any errors
            if error == nil && data != nil {
                
                // Check that the downloaded url matches the caategory meal thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.categorymeals?.strMealThumb {
                    // Category meal cell has been recycled for another catecory meal and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.categoryMealImageView.image = image
                }
            }
        }
        dataTaks.resume()
    }
}
