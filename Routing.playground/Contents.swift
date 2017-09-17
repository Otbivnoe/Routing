//: Playground - noun: a place where people can play

import UIKit

class Routing: ErrorRoute, TestRoute {

    let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}




protocol ErrorRoute {
    func show(error: Error)
}

extension ErrorRoute where Self: Routing {
    func show(error: Error) {
        // show
    }
}


protocol TestRoute {
    func show()
}

extension TestRoute where Self: Routing {
    func show() {}
}






final class StoresViewController: UIViewController {}

class StoresRouter {

    typealias Routes = TestRoute & ErrorRoute

    private let viewController: StoresViewController
    let route: Routes

    init(viewController: StoresViewController) {
        self.route = Routing(viewController: viewController)
        self.viewController = viewController
    }
}
