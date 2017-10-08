//
//  RegisterVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 15.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var typeAccountPicker: UIPickerView!
    
    let typeAccountArray = ["Волонтёр","Партнёр", "Владелец питомца"]
    
    
    @IBAction func TapRegisterAndGotoMainFunctionality(_ sender: UIButton) {
      
        
    
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        typeAccountPicker.delegate = self
        typeAccountPicker.dataSource = self
        
        designOurButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func designOurButton(){
        registerButton.layer.cornerRadius = 12
        registerButton.clipsToBounds = true
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.brown.cgColor
        
        typeAccountPicker.layer.cornerRadius = 12
        typeAccountPicker.layer.borderWidth = 1
        typeAccountPicker.layer.borderColor = UIColor.white.cgColor
    
    }
    //MARK: - PICKER VIEW DELEGATE
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return typeAccountArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return typeAccountArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: typeAccountArray[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 2{
            let controller = storyboard?.instantiateViewController(withIdentifier: "FriendsTVC")
            self.present(controller!, animated: true, completion: nil)
        }
    }
  
    
}
