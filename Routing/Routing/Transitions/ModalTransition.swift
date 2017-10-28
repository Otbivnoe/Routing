//
//  ModalTransition.swift
//  Routing
//
//  Created by Nikita Ermolenko on 28/10/2017.
//

import UIKit

class ModalTransition: NSObject, Transition {

    var animator: Animator?
    var isAnimated: Bool = true

    weak var viewController: UIViewController?

    init(animator: Animator? = nil, isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }

    func open(_ viewController: UIViewController) {
        viewController.transitioningDelegate = self
        self.viewController?.present(viewController, animated: isAnimated, completion: nil)
    }

    func close(_ viewController: UIViewController) {
        viewController.dismiss(animated: isAnimated, completion: nil)
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension ModalTransition: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
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
