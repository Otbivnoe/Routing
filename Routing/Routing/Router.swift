//
//  Router.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

protocol Closable: class {
    func close()
}

protocol Routerable: class, Closable {
    associatedtype V: UIViewController
    weak var viewController: V? { get }
    
    func open(_ presentedViewController: UIViewController?, transition: Transition)
    func close(_ closedViewController: UIViewController?, transition: Transition)
}

class Router<U>: NSObject, Routerable, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate where U: UIViewController {
    typealias V = U
    
    weak var viewController: U?
    weak var closableRoute: ClosableRoute?
    
    private var animator: Animator?
    
    func close() {
        closableRoute?.closeRoute()
    }
    
    func open(_ presentedViewController: UIViewController?, transition: Transition) {
        guard let presentedViewController = presentedViewController else {
            assertionFailure("Can't present a nil view controller.")
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
            if let animator = parameters.animator {
                self.animator = animator
                presentedViewController.transitioningDelegate = self
            }
            viewController?.present(presentedViewController, animated: parameters.animated, completion: nil)
        }
    }
    
    func close(_ closedViewController: UIViewController?, transition: Transition) {
        guard let closedViewController = closedViewController else {
            assertionFailure("Can't close a nil view controller.")
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
            closedViewController.dismiss(animated: parameters.animated, completion: nil)
        }
    }
    
    // MARK: - UINavigationControllerDelegate
    
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
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        animator.isPresenting = true
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        animator.isPresenting = false
        return animator
    }
}
