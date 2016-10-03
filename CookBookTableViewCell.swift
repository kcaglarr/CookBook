//
//  CookBookTableViewCell.swift
//  CookBook
//
//  Created by Kerim Çağlar on 01/10/2016.
//  Copyright © 2016 Kerim Çağlar. All rights reserved.
//

import UIKit

class CookBookTableViewCell: UITableViewCell {

    @IBOutlet weak var cookImage: UIImageView!
    @IBOutlet weak var cookName: UILabel!
    @IBOutlet weak var cookDuration: UILabel!
    @IBOutlet weak var personCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
