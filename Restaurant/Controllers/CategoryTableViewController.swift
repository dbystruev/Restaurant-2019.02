//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Denis Bystruev on 18/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuController.shared.fetchCategories { categories in
            print(#function, categories ?? "nil")
        }
        
        MenuController.shared.fetchMenuItems(forCategory: "appetizers") { menuItems in
            print(#function)
            menuItems?.forEach { print("\t\($0)") }
            print()
        }
        
        MenuController.shared.submitOrder(forMenuIDs: [5, 6, 5, 5, 5, 5]) { time in
            print(#function, "time =", time ?? "nil")
        }
    }
}
