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
    
  }
  
  
}
