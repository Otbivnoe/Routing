//
//  Transition.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

protocol Transition: class {
    weak var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
