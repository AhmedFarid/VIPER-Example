//
//  RecipeDetailsRouter.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
  weak var viewController: UIViewController?
  
  static func createAnModule(with Recipe: Recipe) -> UIViewController {
    let interactor = RecipeDetailsInteractor()
    let router = RecipeDetailsRouter()
    let view = RecipeDetailsViewController()
    let presenter = RecipeDetailsPresenter(view: view, interactor: interactor, router: router, recipe: Recipe)
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    return view
  }
}
