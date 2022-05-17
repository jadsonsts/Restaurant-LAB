//
//  MenuTableVC.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import UIKit

class MenuTableVC: UITableViewController {
    

    var menuItems = [MenuItem]()
    //property to hold the category data
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.capitalized
        MenuController.shared.fetchMenuItems(forCategory: category) { menuItems in
            if let menuItems = menuItems {
                self.updateUI(with: menuItems)
            }
        }
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.menuCellIdentifier, for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "NZD %.2f", menuItem.price)
        //checking if I have the image
        MenuController.shared.fetchImage(url: menuItem.imageURL) { image in
            guard let image = image else {return}
        //checking the indexpath in order to put the right image, as the cell is reusable, it may put in the wrong place
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath != indexPath {
                    return
                }
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //MARK: - Delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.menuDetailSegue {
            let menuItemDetailVC = segue.destination as! MenuItemDetailVC
            let index = tableView.indexPathForSelectedRow!.row
            menuItemDetailVC.menuItem = menuItems[index]
        }
    }

}
