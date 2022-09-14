//
//  RecipeDetailsPresenter.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import Foundation

class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol, RecipeDetailsInteractorOutPutProtocol {
  
  weak var view: RecipeDetailsViewProtocol?
  private let interactor: RecipeDetailsInteractorInPutProtocol
  private let router: RecipeDetailsRouterProtocol
  var recipe: Recipe?
  
  init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorInPutProtocol, router: RecipeDetailsRouterProtocol, recipe: Recipe) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.recipe = recipe
  }
  
  func viewDidLoad() {
    if let recipe = recipe {
      if let title = recipe.label {
        view?.setupNavigationTitle(title: title)
      }
      if let image = recipe.image {
        view?.setupRecipeImage(image: image)
      }
      
      if let publisherUrl = recipe.shareAs {
        view?.setupRecipeUrl(stringUrl: publisherUrl)
      }
      
      if let ingredients = recipe.ingredientLines {
        view?.setupIngredientsTable(withData: ingredients)
      }
    }
  }
  
  
}
