//
//  PurchaseModuleBuilder.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

final class PurchaseModuleBuilder {
    
    static func module() -> PurchaseViewController {
        let router = PurchaseRouter()
        let viewModel = PurchaseViewModel(router: router)
        let viewController = PurchaseViewController(viewModel: viewModel)
        router.viewController = viewController        
        return viewController
    }
}
