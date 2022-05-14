//
//  MenuItem.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import Foundation

struct MenuItems: Codable {
    let items: [MenuItem]
}

struct MenuItem: Codable {
    
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}


