//
//  MainVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 15.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var logInbutton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
     designOurButton()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func designOurButton(){
        logInbutton.layer.cornerRadius = 12
        logInbutton.clipsToBounds = true
        logInbutton.layer.borderWidth = 1
        logInbutton.layer.borderColor = UIColor.brown.cgColor
        
        registerButton.layer.cornerRadius = 12
        registerButton.clipsToBounds = true
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.brown.cgColor
        
        
        
        
    }

}
