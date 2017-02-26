//
//  SortByCell.swift
//  Yelp
//
//  Created by Phong on 26/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol SortByCellDelegate {
    @objc optional func sortByCellDidSwitchChanged(_ switchCell: SortByCell)
}
class SortByCell: UITableViewCell {

    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var sortBySwitch: UISwitch!
    weak var delegate: SortByCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        delegate?.sortByCellDidSwitchChanged?(self)
    }
}
