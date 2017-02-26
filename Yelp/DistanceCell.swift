//
//  DistanceCell.swift
//  Yelp
//
//  Created by Phong on 26/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol DistanceCellDelegate {
    @objc optional func distanceCellDidSwitchChanged(_ switchCell: DistanceCell)
}

class DistanceCell: UITableViewCell {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceSwitch: UISwitch!
    weak var delegate: DistanceCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        delegate?.distanceCellDidSwitchChanged?(self)
    }
}
