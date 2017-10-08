//
//  FriendProfile.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class FriendProfile: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapButton: UIButton!
    var shops: Friend?

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
        
    }
    
    
    @IBAction func makeACall(_ sender: UIButton!){
        
           if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
            
            print(context)
            
            let myPhone = shops?.phone
        
            if let url = URL(string: myPhone!) {
                if #available(iOS 10, *){
                    UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                        print(success)
                        print(String(describing: myPhone))
                    })
                }else {
                    let success = UIApplication.shared.openURL(url)
                    print(success)
                }
            }
        
        }
    }
    
    @IBAction func unwingSegue(segue: UIStoryboardSegue){
        
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
            
            
            
            
            
            
            
            do {
                try context.save()
            }catch let error as NSError{
                print(error)
            }
            
            
            
            
            
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let buttons = [mapButton]
        
        for button in buttons {
            
            guard let button = button else {break}
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            
        }
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        
        imageView.image = UIImage(data: shops!.logo! as Data)
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = shops!.name
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FriendDetailCell
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Кличка:"
            cell.keyLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.valueLabel.text = shops!.name
            cell.valueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        case 1:
            cell.keyLabel.text = "Порода:"
            cell.keyLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.valueLabel.text = shops!.type
            cell.valueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        case 2:
            cell.keyLabel.text = "Адрес:"
            cell.keyLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.valueLabel.text = shops!.location
            cell.valueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        case 3:
            cell.keyLabel.text = "Статус:"
            cell.keyLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.valueLabel.text = shops?.isHelped
            cell.valueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case 4:
            cell.keyLabel.text = "О питомце:"
            cell.keyLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.valueLabel.text = shops?.about
            cell.valueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

            
            
        default:
            break
        }
        cell.backgroundColor = UIColor.clear
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMap"{
            let dvc = segue.destination as! MapVC
            dvc.friend = self.shops
            
            
        }
        
    }



  

}
