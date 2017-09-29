//
//  Transition.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}

enum Transition {
    case modal(Parameters)
    case push(Parameters)
    
    final class Parameters {
        var animator: Animator?
        var animated: Bool = true
        
        static var `default` = Parameters()
        
        init(animator: Animator? = nil, animated: Bool = true) {
            self.animator = animator
            self.animator = animator
        }
    }
}
