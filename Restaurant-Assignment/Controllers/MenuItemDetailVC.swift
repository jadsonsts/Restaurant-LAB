//
//  MenuItemDetailVC.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import UIKit

class MenuItemDetailVC: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailsTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "NZD %.2f", menuItem.price)
        detailsTextLabel.text = menuItem.detailText
        addToOrderButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func addToOrderTapped(_ sender: UIButton) {
        animate()
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    func animate(){
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
}
