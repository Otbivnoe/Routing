//: Playground - noun: a place where people can play

import UIKit



protocol Transition {
    init()
    func show(_ viewController: UIViewController, from: UIViewController, animated: Bool)
    func close(_ viewController: UIViewController)
}

final class Push: Transition {

    func show(_ viewController: UIViewController, from fromViewController: UIViewController, animated: Bool) {
        fromViewController.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func close(_ viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}

final class Modal: Transition {

    func show(_ viewController: UIViewController, from fromViewController: UIViewController, animated: Bool) {
        fromViewController.present(viewController, animated: animated, completion: nil)
    }
    
    func close(_ viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}






protocol Route {}
extension Route where Self: Routerable {
    func open(_ viewController: UIViewController, transition: Transition.Type, animated: Bool = true) {
        let transition = transition.init()
        transition.show(viewController, from: self.viewController!, animated: animated)
    }
    
    func close(transition: Transition.Type, animated: Bool = true) {
        
    }
}



protocol Closable {
    func close()
}



protocol PurchaseRoute: Route, Closable {
    associatedtype PurchaseRouteType: Transition
    func show()
}

extension PurchaseRoute where Self: Routerable {
    func show() {}
    func close() {}
}




protocol OpenSettingsRoute {
    func openSettingsModule()
}

protocol SettingsRoute: Route, OpenSettingsRoute, Closable {
    associatedtype SettingsRouteType: Transition
}

extension SettingsRoute where Self: Routerable {
    func openSettingsModule() {
        open(UIViewController(), transition: SettingsRouteType.self)
    }
    
    func close() {
        close(transition: SettingsRouteType.self)
    }
}






final class StoresViewController: UIViewController {}

protocol Routerable: Closable {
    associatedtype T: UIViewController
    weak var viewController: T? { get }
}

class Router<U>: Routerable where U: UIViewController {
    typealias T = U
    
    weak var viewController: U?
    var closableRoute: Closable?
 
    func close() {
        closableRoute?.close()
    }
}

typealias StoresRoutes = OpenSettingsRoute
final class StoresRouter: Router<StoresViewController>, SettingsRoute {
    
    typealias SettingsRouteType = Push
}




class ViewModel<T> {
    let router: T
    init(router: T) {
        self.router = router
    }
}

final class StoresViewModel: ViewModel<StoresRoutes> {}

let storesRouter = StoresRouter()
let viewModel = StoresViewModel(router: storesRouter)
viewModel.router.openSettingsModule()


