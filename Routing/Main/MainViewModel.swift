//
//  MainViewModel.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

class MainViewModel {

    private let router: MainRouter.Routes
    
    init(router: MainRouter.Routes) {
        self.router = router
    }
    
    func didTriggerSettingsEvent() {
        router.openSettingsModule()
    }
}
