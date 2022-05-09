//
//  IntermediaryModels.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 9/05/22.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}


struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
