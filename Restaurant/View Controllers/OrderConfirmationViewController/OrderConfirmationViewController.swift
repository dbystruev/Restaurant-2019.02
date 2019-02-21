//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Denis Bystruev on 21/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order!  Your wait time is \(minutes!) minutes."
    }
}
