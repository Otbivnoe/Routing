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
        let (controller, router) = SettingsModuleBuilder.module()

        let transition = settingsTransition // it's a calculated property so I saved it to the variable.
        router.openTransition = transition
        open(controller, transition: transition)
    }
}
