//
//  RecipeRouter.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import UIKit

class RecipeRouter: RecipeRouterProtocol {
  weak var viewController: UIViewController?
  static func createAnModule() -> UIViewController {
      let interactor = RecipeInteractor()
      let router = RecipeRouter()
      let view = RecipeViewController()
      let presenter = RecipePresenter(view: view, interactor: interactor, router: router)
      view.presenter = presenter
      interactor.presenter = presenter
      router.viewController = view
      return view
  }

  func navigateToDetailsView(withRecipe: Recipe) {
    let recipesDetailsView = RecipeDetailsRouter.createAnModule(with: withRecipe)
    viewController?.navigationController?.pushViewController(recipesDetailsView, animated: true)

  }
  

}


