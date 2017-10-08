//
//  DonationVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 14.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class DonationVC: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var bankCardField: UITextField!
    @IBOutlet weak var codeCard: UITextField!
    
    var menuShowing = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        donateButton.layer.cornerRadius = 10
        donateButton.clipsToBounds = true
        donateButton.layer.borderColor = UIColor.white.cgColor
        donateButton.layer.borderWidth = 2
        
        self.paymentView.frame = CGRect(x: -358, y: 0, width: 358, height: 330)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donateToPhone(_ sender: UIButton!){
        
        if menuShowing {
            self.paymentView.frame = CGRect(x: -358, y:0 , width: 358, height: 330)

        }else {
            self.paymentView.frame = CGRect(x: 8, y: 249, width: 358, height: 330)
            
            UIView.animate(withDuration: 1.4, animations: {
                self.paymentView.frame = CGRect(x: 8, y: 249, width: 358, height: 330)

            })

        }
    
        menuShowing = !menuShowing
    }

    
    }

  

  

