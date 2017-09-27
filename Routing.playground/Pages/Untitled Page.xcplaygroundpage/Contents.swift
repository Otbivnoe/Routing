//: Playground - noun: a place where people can play

import UIKit

class Routing: TestRoute, ErrorRoute {

    let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


protocol Closable {
    func close()
}


protocol ErrorRoute {
    func show(error: Error)
}

extension ErrorRoute where Self: Routing {
    func show(error: Error) {}
}


protocol TestRoute: Closable {
    func show()
}

extension TestRoute where Self: Routing {
    func show() {}
    func close() {}
}








final class StoresViewController: UIViewController {}

class Router {
    var openRoute: Closable?
    
    func close() {
        openRoute?.close()
    }
}

class StoresRouter: Router {

    typealias Routes = TestRoute & ErrorRoute

    private let viewController: StoresViewController
    let route: Routes

    init(viewController: StoresViewController) {
        self.route = Routing(viewController: viewController)
        self.viewController = viewController
    }
}
