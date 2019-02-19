//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Denis Bystruev on 18/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
