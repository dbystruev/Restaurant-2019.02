//
//  Order.swift
//  Restaurant
//
//  Created by Denis Bystruev on 18/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
