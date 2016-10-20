//
//  CookBookDetailViewController.swift
//  CookBook
//
//  Created by Kerim Çağlar on 15/10/2016.
//  Copyright © 2016 Kerim Çağlar. All rights reserved.
//

import UIKit

class CookBookDetailViewController: UIViewController {
    
    @IBOutlet weak var cookImage: UIImageView!
    
    var selectedCookItems:String?
    
    var selectedCookDetail:String?
    
    var selectedImageURL: String?
    
    var selectedImageData: NSData?
    
    let imageBaseUrl = "http://www.kerimcaglar.com/uploads/yemek-resimler/"

    
    @IBOutlet weak var recipe: UILabel!
    
    @IBOutlet weak var recipeDetail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        log.info("Detay Sayfasındasınız")
        recipe.text = selectedCookItems
        recipeDetail.text = selectedCookDetail
        let url = NSURL(string:imageBaseUrl + selectedImageURL!)
        selectedImageData = NSData(contentsOf:(url! as URL))

        
        
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
