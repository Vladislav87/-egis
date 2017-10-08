//
//  PartnersCell.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class PartnersCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var logo: UIImageView!




    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
