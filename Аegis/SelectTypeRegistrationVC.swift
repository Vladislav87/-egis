//
//  SelectTypeRegistrationVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 24.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class SelectTypeRegistrationVC: UIViewController {
    

    
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //вызываем метод который раскрашивает кнопку.
        designOurButton()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func mailRegister(_ sender: UIButton){
        
    }
    @IBAction func facebookRegister(_ sender: UIButton){
        
    }
    func designOurButton(){
        
        //украшаем нашу кнопку
        fbButton.layer.cornerRadius = 12
        fbButton.clipsToBounds = true
        fbButton.layer.borderWidth = 1
        fbButton.layer.borderColor = UIColor.brown.cgColor
        
        mailButton.layer.cornerRadius = 12
        mailButton.clipsToBounds = true
        mailButton.layer.borderWidth = 1
        mailButton.layer.borderColor = UIColor.brown.cgColor
        
        
        
        
    }
    
  
    
    
}
