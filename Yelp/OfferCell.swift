//
//  OfferCell.swift
//  Yelp
//
//  Created by Phong on 26/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol OfferCellDelegate {
    @objc optional func offerCellDidSwitchChanged(_ switchCell: OfferCell)
}
class OfferCell: UITableViewCell {

    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var offerSwitch: UISwitch!
    weak var delegate: OfferCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        delegate?.offerCellDidSwitchChanged?(self)
    }
}
