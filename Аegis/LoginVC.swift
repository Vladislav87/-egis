//
//  LoginVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 24.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        designOurButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logIn(_ sender: UIButton){
        
    }
    func designOurButton(){
        
        //украшаем нашу кнопку
        loginButton.layer.cornerRadius = 12
        loginButton.clipsToBounds = true
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.brown.cgColor
        
   
        
        
        
        
    }

 
}
