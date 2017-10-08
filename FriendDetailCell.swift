//
//  FriendDetailCell.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class FriendDetailCell: UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
