//
//  UserDetailsRouter.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import UIKit

class UserDetailsRouter: UserDetailsRouterProtocol {
  var viewController: UIViewController?
  
  static func createModule(user: User) -> UIViewController {
    let view = UserDetailsViewController(nibName: "UserDetailsViewController", bundle: nil)
    let router = UserDetailsRouter()
    let presenter = UserDetailsPresenter(view: view, router: router, user: user)
    view.presenter = presenter
    router.viewController = view
    return view
  }
}
