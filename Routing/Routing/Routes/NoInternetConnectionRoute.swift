//
//  NoInternetConnectionRoute.swift
//  Routing
//
//  Created by Nikita Ermolenko on 29/09/2017.
//

import Foundation
import UIKit

protocol NoInternetConnectionRoute {
    func openNoInternetConnectionAlert()
}

extension NoInternetConnectionRoute where Self: RouterProtocol {
    
    func openNoInternetConnectionAlert() {
        let alertViewController = UIAlertController(title: "Title", message: "No internet connection", preferredStyle: .alert)
        viewController?.present(alertViewController, animated: true, completion: nil)
    }
}
