//
//  ViewModel.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//

import Foundation

class ViewModel<T> {
    let router: T
    init(router: T) {
        self.router = router
    }
}
