//
//  UserDetailsRouter.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import UIKit

class UserDetailsRouter: UserDetailsRouterProtocol {
  var viewController: UIViewController?
  
  static func createModule() -> UIViewController {
    let view = UserDetailsViewController(nibName: "UserDetailsViewController", bundle: nil)
    let interactor = UserDetailsInteractor()
    let router = UserDetailsRouter()
    let presenter = UserDetailsPresenter(view: view, interactor: interactor, router: router)
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    return view
  }
}
