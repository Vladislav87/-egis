//
//  PartnersProfile.swift
//  Аegis
//
//  Created by Владислав Ходеев on 13.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class PartnersProfile: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var names = [String]()
    var types = [String]()
    var status = [String]()
    var locations = [String]()
    var discounts = [String]()
    var actions = [String]()
    var phones = [String]()
    var email = [String]()
    let picker = UIImagePickerController()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var logoForChanging: UIImageView!
    
    
    @IBAction func addNewLogo(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.delegate = self

        
     
       let actionSheet = UIAlertController(title: "Выбрать или создать логотип из:", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Фотокамера", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
                self.present(picker, animated: true, completion: nil)

            }else {
                print("Камера недоступна")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Фотопоток", style: .default, handler: { (action:UIAlertAction) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)

            
        }))
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        logoForChanging.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
  
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(names)
        print(types)
        print(status)
        print(locations)
        print(discounts)

        

    }
  
  

   
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PartnerDetailCell
        
        cell.partnerName.text = names[indexPath.row]
        cell.partnerType.text = types[indexPath.row]
        cell.partnerStatus.text = status[indexPath.row]
        cell.partnerActions.text = actions[indexPath.row]
        cell.partnerDiscount.text = discounts[indexPath.row]
        cell.partnerLocation.text = locations[indexPath.row]
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMap"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! PartnerMapVC
                dvc.location = [locations[indexPath.row]]
                
                
                
                
                
            }
        }
    }
}
