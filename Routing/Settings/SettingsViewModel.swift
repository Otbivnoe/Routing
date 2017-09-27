//
//  SettingsViewModel.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

final class SettingsViewModel {

    private let router: SettingsRouter
    
	// MARK: - Lifecycle

    init(router: SettingsRouter) {
        self.router = router
    }

    func didTriggerViewReadyEvent() {
        
    }
}
