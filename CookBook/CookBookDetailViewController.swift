//
//  CookBookDetailViewController.swift
//  CookBook
//
//  Created by Kerim Çağlar on 15/10/2016.
//  Copyright © 2016 Kerim Çağlar. All rights reserved.
//

import UIKit
import AARatingBar

class CookBookDetailViewController: UIViewController {
    
    @IBOutlet weak var cookImage: UIImageView!
    
    var selectedCookItems:String?
    
    var selectedCookDetail:String?
    
    var selectedImageURL: String?
    
    var selectedImageData: NSData?
    
    @IBOutlet weak var ratingBar: AARatingBar!
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipe: UILabel!
    
    @IBOutlet weak var recipeDetail: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        log.info("Detay Sayfasındasınız")
        recipe.text = selectedCookItems
        recipeDetail.text = selectedCookDetail
        recipeImageView.sd_setImage(with: URL(string:selectedImageURL!))
        
        ratingBar.ratingDidChange = { ratingValue in
            
            print(ratingValue)
            
        }
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
