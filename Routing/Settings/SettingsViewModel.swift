//
//  SettingsViewModel.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

final class SettingsViewModel {

    weak var output: SettingsModuleOutput?

    private let router: SettingsRouter.Routes

	// MARK: - Lifecycle

    init(router: SettingsRouter.Routes) {
        self.router = router
    }

    func didTriggerViewReadyEvent() {
        
    }
    
    func closeEvent() {
        router.close()
    }
}

// MARK: - SettingsModuleInput

extension SettingsViewModel: SettingsModuleInput {
}
