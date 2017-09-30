//
//  MainRouter.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation
import UIKit

final class MainRouter: Router<MainViewController>, SettingsRoute, NoInternetConnectionRoute, AppSettingsRoute {

    typealias Routes = OpenSettingsRoute & NoInternetConnectionRoute & AppSettingsRoute

    var settingsTransition: Transition {
        switch selectedIndex {
        case 0: return .push(Transition.Parameters(animated: true))
        case 1: return .modal(Transition.Parameters.default)
        case 2: return .modal(Transition.Parameters(animator: FadeAnimator()))
        case 3: return .push(Transition.Parameters(animator: FadeAnimator()))
            
        default: return .push(Transition.Parameters.default)
        }
    }
        
    private var selectedIndex: Int {
        return UserDefaults.standard.value(forKey: "index") as? Int ?? 0
    }
    
}
