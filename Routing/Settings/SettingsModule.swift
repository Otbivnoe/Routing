//
//  SettingsModuleBuilder.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

protocol SettingsModuleInput: class {
}

protocol SettingsModuleOutput: class {
}

final class SettingsModule {

    var input: SettingsModuleInput {
        return viewModel
    }

    var output: SettingsModuleOutput? {
        set {
            viewModel.output = newValue
        }
        get {
            return viewModel.output
        }
    }

    let router: SettingsRouter
    let viewController: SettingsViewController

    private let viewModel: SettingsViewModel

    init() {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let viewController = SettingsViewController(viewModel: viewModel)
        router.viewController = viewController

        self.router = router
        self.viewController = viewController
        self.viewModel = viewModel
    }
}
