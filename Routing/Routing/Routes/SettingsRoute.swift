//
//  SettingsRoute.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation

protocol SettingsRoute {
    var settingsTransition: Transition { get }
    func openSettingsModule()
}

extension SettingsRoute where Self: RouterProtocol {
    func openSettingsModule() {
        let module = SettingsModule()

        let transition = settingsTransition // it's a calculated property so I saved it to the variable in order to have one instance
        module.router.openTransition = transition
        open(module.viewController, transition: transition)
    }
}
