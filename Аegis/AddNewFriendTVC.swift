//
//  AddNewFriendTVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class AddNewFriendTVC: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameShopField: UITextField!
    @IBOutlet weak var addressShopField: UITextField!
    @IBOutlet weak var typeShopField: UITextField!
    @IBOutlet weak var statusIsHelped: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    @IBOutlet weak var aboutPet: UITextView!

    
    

   
    var isHelped = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
     
    }
    
    
    @IBAction func isVisitedAction(_ sender: UIButton) {
        
        if sender == statusIsHelped {
        }else {
           
            
        }
    }
    
    @IBAction func saveNewShops(_ sender: UIBarButtonItem) {
        
        if nameShopField.text == "" || addressShopField.text == "" || typeShopField.text == "" || statusIsHelped.text == "" || contactPhone.text == "" || aboutPet.text == ""  {
            
            let alertcontroller = UIAlertController(title: "", message: "Заполните все поля", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertcontroller.addAction(ok)
            present(alertcontroller, animated: true, completion: nil)
        }else {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
                let shop = Friend(context: context)
                shop.name = nameShopField.text
                shop.location = addressShopField.text
                shop.type = typeShopField.text
                shop.isHelped = statusIsHelped.text
                shop.phone = contactPhone.text
                shop.about = aboutPet.text
                if let image = imageView.image {
                    shop.logo = UIImagePNGRepresentation(image) as NSData?
                }
                
                do {
                    try context.save()
                    print("удалось сохранить")
                }catch let error as NSError {
                    print("не удалось сохранить \(error)")
                }
            }
            
            
            performSegue(withIdentifier: "backToMain", sender: self)
        }
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        dismiss(animated: true,completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: "Выбрать из:", message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Камера", style: .default, handler: { (action) in
                self.chooseImagePickerImage(source: .camera)

                
            })
            
            let photoLibrary = UIAlertAction(title: "Фотопоток", style: .default, handler: { (action) in
                self.chooseImagePickerImage(source: .photoLibrary)
            })
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addAction(camera)
            alertController.addAction(photoLibrary)
            alertController.addAction(cancel)
            self.present(alertController, animated: true, completion: nil)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    func chooseImagePickerImage(source: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagepicker = UIImagePickerController()
            imagepicker.delegate = self
            imagepicker.allowsEditing = true
            imagepicker.sourceType = source
            
            self.present(imagepicker, animated: true, completion: nil)
        }
    }

    
}
