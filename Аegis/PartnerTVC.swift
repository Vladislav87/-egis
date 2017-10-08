//
//  PartnerTVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit

class PartnerTVC: UITableViewController {

    var partnersName = ["Кот и Пёс", "Усы, лапы, хвосты"]
    let partnersLogo = ["testLogo.png","testLogo-1.png"]
    let partnersType = ["Зоомагазин", "Зоомагазин"]
    let partnersLocation = ["Минск, улица Козлова 19", "Минск, улица Немига 3"]
    let partnersDiscount = ["13%","15%"]
    let partnersStatus = ["Официальный парнёр" , "Меценат"]
    let partnersAction = ["Скидки на все корма Royal Canin","20 бесплатных лотков для котов"]
    let partnersPhones = ["80299992222","80292221133"]
    let partnersEmail = ["vlad_pro@icloud.com","vlad_pro@icloud.com"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return partnersName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PartnersCell
        cell.logo.image = UIImage(named: partnersLogo[indexPath.row])
        cell.nameLabel.text = partnersName[indexPath.row]
        cell.typeLabel.text = partnersType[indexPath.row]
        cell.discountLabel.text = partnersDiscount[indexPath.row]
        cell.statusLabel.text = partnersStatus[indexPath.row]

        return cell
    }
 

   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! PartnersProfile
                dvc.names = [partnersName[indexPath.row]]
                dvc.types = [partnersType[indexPath.row]]
                dvc.status = [partnersStatus[indexPath.row]]
                dvc.locations = [partnersLocation[indexPath.row]]
                dvc.discounts = [partnersDiscount[indexPath.row]]
                dvc.actions = [partnersAction[indexPath.row]]
                dvc.phones = [partnersPhones[indexPath.row]]
                dvc.email = [partnersEmail[indexPath.row]]
                
                
                
                
                
                
                
            }
        }
        
        
        
    }
    

}
