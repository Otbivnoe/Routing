//: [Previous](@previous)

import Foundation
import UIKit
import ObjectiveC

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}

enum Transition {
    case modal(Parameters)
    case push(Parameters)
    //    case tab
    
    final class Parameters {
        typealias CompletionHandler = () -> Void
        
        var animator: Animator?
        var animated: Bool = true
        var completion: CompletionHandler?
        
        static var `default` = Parameters()
        
        init(animator: Animator? = nil, animated: Bool = true, completion: CompletionHandler? = nil) {
            self.animator = animator
            self.animator = animator
            self.completion = completion
        }
    }
}





protocol Closable: class {
    func close()
}


private struct AssociatedKeys {
    static var animatorKey = "nx_animator"
}

protocol Route: class, UINavigationControllerDelegate, Closable {}
extension Route where Self: Routerable {
    
    private var animator: Animator? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.animatorKey) as? Animator
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.animatorKey, animator, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func open(_ presentedViewController: UIViewController?, transition: Transition) {
        guard let presentedViewController = presentedViewController else {
            assertionFailure("Cann't present a nil view controller.")
            return
        }
        switch transition {
        case let .push(parameters):
            if let animator = parameters.animator {
                self.animator = animator
                viewController?.navigationController?.delegate = self
            }
            viewController?.navigationController?.pushViewController(presentedViewController, animated: parameters.animated)
        case let .modal(parameters):
            viewController?.present(presentedViewController, animated: parameters.animated, completion: parameters.completion)
        }
    }
    
    func close(_ closedViewController: UIViewController?, transition: Transition) {
        guard let closedViewController = closedViewController else {
            assertionFailure("Cann't close a nil view controller.")
            return
        }
        switch transition {
        case let .push(parameters):
            if let animator = parameters.animator {
                self.animator = animator
                viewController?.navigationController?.delegate = self
            }
            viewController?.navigationController?.popViewController(animated: parameters.animated)
        case let .modal(parameters):
            closedViewController.dismiss(animated: parameters.animated, completion: parameters.completion)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            animator?.isPresenting = true
            return nil
        }
        else {
            animator?.isPresenting = false
            return nil
        }
    }
}




protocol OpenNoInternetConnectionRoute {
    func openNoInternetConnectionAlert()
}

protocol NoInternetConnectionRoute: OpenNoInternetConnectionRoute {}

extension NoInternetConnectionRoute where Self: Routerable {
    func openNoInternetConnectionAlert() {
        let alertViewController = UIAlertController(title: "Title", message: "No internet connection", preferredStyle: .alert)
        viewController?.present(alertViewController, animated: true, completion: nil)
    }
}






protocol OpenSettingsRoute {
    func openSettingsModule()
}

protocol SettingsRoute: Route, OpenSettingsRoute {
    var settingsTransition: Transition { get }
}

extension SettingsRoute where Self: Routerable {
    func openSettingsModule() {
        let settingsRouter = SettingsRouter2()
        settingsRouter.closableRoute = self
        open(viewController, transition: settingsTransition)
    }
    
    func close() {
        close(viewController, transition: settingsTransition)
    }
}




class ProfileViewController: UIViewController {}
class SettingsViewController2: UIViewController {}




protocol Routerable: Closable {
    associatedtype V: UIViewController
    weak var viewController: V? { get }
}

class Router<U>: NSObject, Routerable where U: UIViewController {
    typealias V = U
    
    weak var viewController: U?
    weak var closableRoute: Closable?
    
    func close() {
        closableRoute?.close()
    }
}





typealias ProfileRoutes = OpenSettingsRoute & OpenNoInternetConnectionRoute

class ProfileRouter: Router<ProfileViewController>, SettingsRoute, NoInternetConnectionRoute {
    
    var settingsTransition: Transition {
        return .push(Transition.Parameters(animated: false))
    }
    
    var friendsListTransition: Transition {
        return .modal(Transition.Parameters.default)
    }
}






class SettingsRouter2: Router<SettingsViewController2> {}




