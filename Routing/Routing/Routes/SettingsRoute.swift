//
//  SettingsRoute.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation

protocol OpenSettingsRoute {
    func openSettingsModule()
}

protocol SettingsRoute: Route, OpenSettingsRoute {
    var settingsTransition: Transition { get }
}

extension SettingsRoute where Self: Routerable {
    func openSettingsModule() {
        let (controller, router) = SettingsModuleBuilder.module()
        router.closableRoute = self
        open(controller, transition: settingsTransition)
    }
    
    func closeRoute() {
        close(viewController, transition: settingsTransition)
    }
}
