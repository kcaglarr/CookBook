//
//  CookBookViewController.swift
//  CookBook
//
//  Created by Kerim Çağlar on 01/10/2016.
//  Copyright © 2016 Kerim Çağlar. All rights reserved.
//

import UIKit
import Alamofire

class CookBookViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cooks = [String]()
    var duration = [String]()
    var person = [String]()
    var cookImageName = [String]()
    let imageBaseUrl = "http://www.kerimcaglar.com/uploads/yemek-resimler/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        Alamofire.request("http://www.kerimcaglar.com/yemek-tarifi").responseJSON { response in
            
            self.retrieveData(JSONData: response.data!)
        }
    }
    
    func retrieveData(JSONData:Data)
    {
        do
        {
            let resultJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers)
            
            if let cookName = resultJSON as? NSArray
            {
                for i in 0..<cookName.count
                {
                    
                    if let cooks = cookName[i] as? NSDictionary
                    {
                        if let cook_name = cooks["yemek_ismi"] as? String
                        {
                            self.cooks.append(cook_name)
                        }
                        
                        if let duration = cooks["sure"] as? String
                        {
                            self.duration.append(duration)
                        }
                        
                        if let person = cooks["kisi_sayisi"] as? String
                        {
                            self.person.append(person)
                        }
                        
                        if let cook_image = cooks["yemek_resim"] as? String
                        {
                            self.cookImageName.append(cook_image)
                        }
                    }
                }

            }
            
                self.tableView.reloadData()

        }
        catch
        {
            log.error(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    /** Table View Data Source **/
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cooks.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CookBookTableViewCell
        

        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: imageBaseUrl + cookImageName[indexPath.row]))
        
        cell.cookName.text = cooks[indexPath.row]
        cell.cookName.textColor = UIColor.white
        cell.cookName.backgroundColor = UIColor(red: 1, green: 152 / 255, blue: 0, alpha: 1)
        cell.cookName.textAlignment = .center
        cell.cookDuration.text = duration[indexPath.row]
        cell.cookDuration.textAlignment = .right
        cell.personCount.text = person[indexPath.row]
        
        return cell
    }
    
}
