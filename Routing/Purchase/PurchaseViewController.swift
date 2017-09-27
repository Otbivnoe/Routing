//
//  PurchaseViewController.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit

final class PurchaseViewController: UIViewController {
    
    let viewModel: PurchaseViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: PurchaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didTriggerViewReadyEvent()
    }
}
