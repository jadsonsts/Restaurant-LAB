//
//  Order.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
