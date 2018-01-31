//
//  MainRouter.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation
import UIKit

final class MainRouter: Router<MainViewController>, MainRouter.Routes {

    typealias Routes = SettingsRoute & NoInternetConnectionRoute & AppSettingsRoute

    var settingsTransition: Transition {
        switch selectedIndex {
        case 0: return PushTransition()
        case 1: return ModalTransition()
        case 2: return ModalTransition(animator: FadeAnimator())
        case 3: return PushTransition(animator: FadeAnimator())
        default: return PushTransition()
        }
    }
        
    private var selectedIndex: Int {
        return UserDefaults.standard.value(forKey: "index") as? Int ?? 0
    }
}
