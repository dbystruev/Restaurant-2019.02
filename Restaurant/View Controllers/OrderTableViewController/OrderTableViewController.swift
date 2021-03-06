//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Denis Bystruev on 21/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    var orderMinutes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            tableView,
            selector: #selector(UITableView.reloadData),
            name: MenuController.orderUpdateNotification,
            object: nil
        )
    }
    
    func uploadOrder() {
        let menuIds = MenuController.shared.order.menuItems.map { $0.id }
        
        MenuController.shared.submitOrder(forMenuIDs: menuIds) { minutes in
            guard let minutes = minutes else { return }
            
            self.orderMinutes = minutes
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ConfirmationSegue", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ConfirmationSegue" else { return }
        
        let controller = segue.destination as! OrderConfirmationViewController
        controller.minutes = orderMinutes
    }
    
    @IBAction func submitTapped() {
        let menuItems = MenuController.shared.order.menuItems
        let orderCount = menuItems.count
        let orderTotal = menuItems.reduce(0) { $0 + $1.price }
        let formattedOrder = String(format: "$%.2f", orderTotal)
        
        let alert = UIAlertController(
            title: "Confirm Order",
            message: "Your total is \(orderCount) item(s) for \(formattedOrder)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Submit",
            style: .default,
            handler: { _ in
                self.uploadOrder()
            }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "DismissConfirmation" else { return }
        
        MenuController.shared.order.menuItems.removeAll()
    }
}
