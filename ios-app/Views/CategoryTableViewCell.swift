//
//  CategoryTableViewCell.swift
//  ios-app
//
//  Created by Louis Shakya on 10/24/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!
    
    var category:Categories?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Create a setcell function
    func setCell(_ c:Categories) {
        
        self.category = c
        
        // Ensure that we have a category
        guard self.category != nil else {
            return
        }
        
        // Set the title and description lable
        self.titleLable.text = category!.strCategory
        self.descriptionLable.text = category!.strCategoryDescription
        
        // Set the thumbnail
        // Check if there is thumbnail or not
        guard self.category!.strCategoryThumb != nil else {
            return
        }
        
        // Create a url object
        let url = URL(string: self.category!.strCategoryThumb!)
        
        // Get the shared URL Session objecty
        let session = URLSession.shared
        
        // Cereate a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check if there were any errors
            if error == nil && data != nil {
                
                // Check that the downloaded url matches the category thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.category?.strCategoryThumb {
                    // Category cell has been recycled for another category and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        // Start data task
        dataTask.resume()
    }

}
