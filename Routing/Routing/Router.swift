//
//  Router.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import UIKit

protocol Closable: class {
    func close()
}

protocol RouterProtocol: class {
    associatedtype V: UIViewController
    weak var viewController: V? { get }
    
    func open(_ viewController: UIViewController, transition: Transition)
}

class Router<U>: RouterProtocol, Closable where U: UIViewController {
    typealias V = U
    
    weak var viewController: V?
    var openTransition: Transition?

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }

    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        openTransition.close(viewController)
    }
}
