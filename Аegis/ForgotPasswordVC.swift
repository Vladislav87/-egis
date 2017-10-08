//
//  ForgotPasswordVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 16.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var restorePasswordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
designOurButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func designOurButton(){
        restorePasswordButton.layer.cornerRadius = 12
        restorePasswordButton.clipsToBounds = true
        restorePasswordButton.layer.borderWidth = 1
        restorePasswordButton.layer.borderColor = UIColor.brown.cgColor
        
       
        
        
        
        
    }

}
