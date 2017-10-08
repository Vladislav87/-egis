//
//  FriendsTVC.swift
//  Аegis
//
//  Created by Владислав Ходеев on 11.06.17.
//  Copyright © 2017 Владислав Ходеев. All rights reserved.
//

import UIKit
import CoreData

class FriendsTVC: UITableViewController,NSFetchedResultsControllerDelegate {
    
    var fetchResultsController: NSFetchedResultsController<Friend>!
    var searchController: UISearchController!
    var filterArray: [Friend] = []
    var friends: [Friend] = []
    
    @IBAction func LogOut(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"MainVC") as! MainVC
        self.present(viewController, animated: true)
        
        
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    func filterContentFor(searchText text:String ){
        filterArray = friends.filter{ (shop) -> Bool in
            return (shop.name?.lowercased().contains(text.lowercased()))!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.brown
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        definesPresentationContext = true

        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        let fetchRequest: NSFetchRequest<Friend> = Friend.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                managedObjectContext: context,
                                                                sectionNameKeyPath: nil,
                                                                cacheName: nil)
            fetchResultsController.delegate = self
            
            do {
                try fetchResultsController.performFetch()
                friends = fetchResultsController.fetchedObjects!
                
                
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
  //  MARK: - Fetch results controller delegate
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert: guard let indexPath = newIndexPath else { break }
        tableView.insertRows(at: [indexPath], with: .fade)
        case .delete: guard let indexPath = indexPath else {break}
        tableView.deleteRows(at: [indexPath], with: .fade)
        case .update: guard let indexPath = indexPath else {break}
        tableView.reloadRows(at: [indexPath], with: .fade)
        default:
            tableView.reloadData()
        }
        friends = controller.fetchedObjects as! [Friend]

    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //MARK: - tableView data delegate
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != ""{
            return filterArray.count
        }

        return friends.count
    }
    func shopsToDisplayAt(indexPath: IndexPath) -> Friend{
        
        let friend: Friend
        if searchController.isActive && searchController.searchBar.text != "" {
            friend = filterArray[indexPath.row]

        }else {
            friend = friends[indexPath.row]

            
        }
        return friend
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FriendCell
        
        let friend = shopsToDisplayAt(indexPath:indexPath)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.alpha = 0.5
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        self.tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.friendImage.image = UIImage(data: friend.logo! as Data)
       
        cell.friendImage.layer.cornerRadius = cell.friendImage.frame.size.height/2
        cell.friendImage.clipsToBounds = true
        cell.imageView?.layer.masksToBounds = true
        cell.friendImage.layer.borderWidth = 2.0;

        
        cell.friendNameLabel.text = friend.name
        cell.friendNameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.friendTypeLabel.text = friend.type
        cell.friendTypeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.friendIsHelped.text = friend.isHelped
        
        cell.tintColor =  #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func deleteData(indexPath: IndexPath) {
            self.friends.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        
    
    }

    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            let defaultText = "Друзья! Мы - команда Aegis, мобильного приложения, направленного на помощь животным. С помощью Aegis вы сможете: помочь бездомным и больным животным обрести второй шанс! Также наша партнёрская сеть позволит вам найти лучшее питание, средства гигиены, лечение и всё самое необходимое для ваших питомцев! Среди наших друзей:  \(self.friends[indexPath.row].name!)!" + " Статус: \(String(describing: self.friends[indexPath.row].isHelped!)). Aegis - скоро в AppStore."
            
            
            if let image = UIImage(data: self.friends[indexPath.row].logo! as Data) {
                let activiryController = UIActivityViewController(activityItems: [defaultText,image], applicationActivities: nil)
                self.present(activiryController, animated: true, completion: nil)
            }
        }
        let delete = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
          
            self.deleteData(indexPath: indexPath)
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext{
                let objectToDelete = self.fetchResultsController.object(at: indexPath)
                context.delete(objectToDelete)
                
                do {
                    try context.save()
                }catch {
                    print(error.localizedDescription)
                    
                }
                
            }
            
            
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        return [delete,share]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! FriendProfile
                dvc.shops = shopsToDisplayAt(indexPath: indexPath)
                
                
                
                
            }
        }
    }

    
    
    
    
    
    
      }
    
extension FriendsTVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentFor(searchText: searchController.searchBar.text!)
        tableView.reloadData()
        
        
        
    }
    
    
    
}
extension FriendsTVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            navigationController?.hidesBarsOnSwipe = false
        }
        }
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            navigationController?.hidesBarsOnSwipe = true
        }
}



