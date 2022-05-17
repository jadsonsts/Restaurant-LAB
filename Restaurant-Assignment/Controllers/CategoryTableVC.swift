//
//  CategoryTableVC.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import UIKit

class CategoryTableVC: UITableViewController {
    
    var categories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        MenuController.shared.fetchCategories { categories in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        }
    }
    
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryCellIdentifier, for: indexPath)
        configure(cell, forItemAt: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString.capitalized
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueToMenu {
            let menuTableVC = segue.destination as! MenuTableVC
            let index = tableView.indexPathForSelectedRow!.row
            menuTableVC.category = categories[index]
        }
    }

}
