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
  
  func navigateToDetailsView(withUser: User) {
    print(withUser.name)
  }
  
  
}

