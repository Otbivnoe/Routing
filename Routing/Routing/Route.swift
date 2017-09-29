//
//  Route.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

protocol ClosableRoute: class {
    func closeRoute()
}

protocol Route: class, ClosableRoute {}
