//
//  UserRouter.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import UIKit

class UsersRouter: UsersRouterProtocol {
  
  weak var viewController: UIViewController?
  
  static func createModule() -> UIViewController{
    let view = UsersViewController(nibName: "UsersViewController", bundle: nil)
    let interactor = UsersInteracor()
    let router = UsersRouter()
    let presenter = UsersPresenter(view: view, interactor: interactor, router: router)
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    return view
  }
  
  func navigateToDetailsView(from view: UsersViewProtocol? ,withUser: User) {
    let userDetailsViewController = UserDetailsRouter.createModule(user: withUser)
    if let viewController = view as? UIViewController {
      viewController.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
  }
  
  
}

