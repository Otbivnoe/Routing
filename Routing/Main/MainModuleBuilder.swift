//
//  MainModuleBuilder.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

final class MainModuleBuilder {
    
    static func module() -> MainViewController {
        let router = MainRouter()
        let viewModel = MainViewModel(router: router)
        let viewController = MainViewController(viewModel: viewModel)
        router.viewController = viewController        
        return viewController
    }
}
