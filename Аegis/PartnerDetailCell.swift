//
//  PartnerDetailCell.swift
//  Аegis
//
//  Created by Владислав Ходеев on 13.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class PartnerDetailCell: UITableViewCell {

    @IBOutlet weak var partnerName: UILabel!
    @IBOutlet weak var partnerType: UILabel!
    @IBOutlet weak var partnerStatus: UILabel!
    @IBOutlet weak var partnerActions: UILabel!
    @IBOutlet weak var partnerDiscount: UILabel!
    @IBOutlet weak var partnerLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
