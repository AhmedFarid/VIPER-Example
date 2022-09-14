//
//  RecipePresenter.swift
//  VIPERExample
//
//  Created by Macintosh on 13/09/2022.
//

import Foundation

class RecipePresenter: RecipePresenterProtocol, RecipeInteractorOutPutProtocol {
  
  weak var view: RecipeViewProtocol?
  private let interactor: RecipeInteractorInPutProtocol
  private let router: RecipeRouterProtocol

  var toPage: Int = 15
  var lastPage: Int = 0 {
    didSet {
      toPage += 15
    }
  }
  
  var recipesHits = [Hits]()
 
  init(view: RecipeViewProtocol, interactor: RecipeInteractorInPutProtocol, router: RecipeRouterProtocol) {
      self.view = view
      self.interactor = interactor
      self.router = router
  }
  
  func viewDidLoad() {
    
  }
  
  func searchData(withKeyWord: String) {
    view?.showActivityIndicator()
    self.lastPage = 0
    self.toPage = 15
    interactor.searchRecipe(withKeyWord: withKeyWord, fromPage: self.lastPage, toPage: self.toPage)
  }
  
  func numberOfRows() -> Int {
    return self.recipesHits.count
  }
  
  func configure(recipesCell cell: RecipesCellView, AtIndexPath indexPath: IndexPath) {
    cell.configureRecipeCell(recipe: self.recipesHits[indexPath.item])
  }
  
  func fetchedRecipeSucsessfully(recipes: [Hits]) {
    self.recipesHits = recipes
    view?.reloadTableView()
    view?.dismissSearchController()
    if recipes.count > 0 {
      view?.scrollToFirstIndex()
    }
    view?.hideActivityIndicator()
  }
  
  func failedToFetchRecipes(stringError err: String) {
    view?.dismissSearchController()
    view?.hideActivityIndicator()
    view?.showError(withMsg: err)
  }
  
  func clearDataSourceOnCancel() {
    
  }
  
  func willDisplayLastCell(keyWord: String) {
  
  }
  
  func didSelect(AtIndexPath indexPath: IndexPath) {
    
  }
  
  
  
  func getLastIndex(index: Int) {
    
  }
  
  func fetchedMoreRecipes(newRecipes: [Hits]) {
    
  }

  
}
