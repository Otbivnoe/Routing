//
//  SettingsModuleBuilder.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

final class SettingsModuleBuilder {
    
    static func module() -> (SettingsViewController, SettingsRouter) {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let viewController = SettingsViewController(viewModel: viewModel)
        router.viewController = viewController        
        return (viewController, router)
    }
}
