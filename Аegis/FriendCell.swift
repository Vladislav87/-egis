//
//  FriendCell.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    @IBOutlet weak var friendTypeLabel: UILabel!
    
    
    @IBOutlet weak var friendIsHelped: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
