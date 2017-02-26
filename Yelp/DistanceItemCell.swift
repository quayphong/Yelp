//
//  DistanceItemCell.swift
//  Yelp
//
//  Created by Phong on 26/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class DistanceItemCell: UITableViewCell {

    @IBOutlet weak var distanceItemLabel: UILabel!
    @IBOutlet weak var distanceItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
