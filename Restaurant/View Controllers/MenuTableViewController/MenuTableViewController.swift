//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Denis Bystruev on 18/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var category: String!
    var menuItems = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.capitalized
        
        MenuController.shared.fetchMenuItems(forCategory: category) { menuItems in
            guard let menuItems = menuItems else { return }
            
            self.updateUI(with: menuItems)
        }
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuDetailSegue" else { return }
        
        let controller = segue.destination as! MenuItemDetailViewController
        
        let index = tableView.indexPathForSelectedRow!.row
        
        let menuItem = menuItems[index]
        
        controller.menuItem = menuItem
    }
}
