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
    
    func open(_ presentedViewController: UIViewController?, transition: Transition)
    func close(_ closedViewController: UIViewController?, transition: Transition)
}

class Router<U>: NSObject where U: UIViewController {

    typealias V = U
    
    weak var viewController: U?
    var openTransition: Transition?
}

// MARK: - RouterProtocol

extension Router: RouterProtocol {

    func open(_ viewController: UIViewController?, transition: Transition) {
        guard let viewController = viewController else {
            assertionFailure("Can't present a nil view controller.")
            return
        }
        transition.viewController = self.viewController
        transition.open(viewController)
    }

    func close(_ viewController: UIViewController?, transition: Transition) {
        guard let viewController = viewController else {
            assertionFailure("Can't close a nil view controller.")
            return
        }
        transition.close(viewController)
    }
}

// MARK: - Closable

extension Router: Closable {

    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        close(viewController, transition: openTransition)
    }
}
