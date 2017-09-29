//
//  MainRouter.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation
import UIKit

final class MainRouter: Router<MainViewController>, SettingsRoute, NoInternetConnectionRoute {

    typealias Routes = OpenSettingsRoute & NoInternetConnectionRoute
    
    var settingsTransition: Transition {
        let index = UserDefaults.standard.value(forKey: "index") as? Int ?? 0
        
        switch index {
        case 0: return .push(Transition.Parameters(animated: true))
        case 1: return .modal(Transition.Parameters.default)
        case 2: return .modal(Transition.Parameters(animator: FadeAnimator()))
            
        default: return .push(Transition.Parameters(animated: true))
        }
    }
}
