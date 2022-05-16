//
//  OrderConfirmationViewController.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 15/05/22.
//

import UIKit

class OrderConfirmationVC: UIViewController {

    @IBOutlet weak var timeRemaningLabel: UILabel!
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeRemaningLabel.text = "Thank you for your order! Your wait time is approximately \(minutes ?? 0) minutes"
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
