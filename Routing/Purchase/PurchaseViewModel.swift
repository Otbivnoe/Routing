//
//  PurchaseViewModel.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

final class PurchaseViewModel {

    private let router: PurchaseRouter
    
	// MARK: - Lifecycle

    init(router: PurchaseRouter) {
        self.router = router
    }

    func didTriggerViewReadyEvent() {
        
    }
}
