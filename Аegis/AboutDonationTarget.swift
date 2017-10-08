//
//  AboutDonationTarget.swift
//  Аegis
//
//  Created by Владислав Ходеев on 14.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class AboutDonationTarget: UIViewController {
    @IBOutlet weak var aboutText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bottom = NSMakeRange(aboutText.text.characters.count - 1, 1)
        aboutText.scrollRangeToVisible(bottom)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
