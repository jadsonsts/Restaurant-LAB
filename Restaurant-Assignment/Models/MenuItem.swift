//
//  MenuItem.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import Foundation


struct MenuItem: Codable {
    
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var categoty: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case categoty
        case imageURL = "image_url"
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}
