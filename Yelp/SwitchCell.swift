//
//  SwitchCell.swift
//  Yelp
//
//  Created by Phong on 24/2/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

protocol SwitchCellDelagate {
    func switchCell(switchCell: SwitchCell, didChangeValue value:Bool)
}


class SwitchCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    var delegate: SwitchCellDelagate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        delegate.switchCell(switchCell: self, didChangeValue: sender.isOn)
    }
}
