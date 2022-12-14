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
  
  func fetchedRecipeSucsessfully(recipes: [Hits]) {
    self.recipesHits = recipes
    view?.reloadTableView()
    view?.dismissSearchController()
    if recipes.count > 0 {
      view?.scrollToFirstIndex()
    }
    view?.hideActivityIndicator()
  }
  
  func numberOfRows() -> Int {
    return self.recipesHits.count
  }
  
  func getLastIndex(index: Int) {
    self.lastPage = index
  }
  
  func configure(recipesCell cell: RecipesCellView, AtIndexPath indexPath: IndexPath) {
    cell.configureRecipeCell(recipe: self.recipesHits[indexPath.item])
  }
  
  func failedToFetchRecipes(stringError err: String) {
    view?.dismissSearchController()
    view?.hideActivityIndicator()
    view?.showError(withMsg: err)
  }
  
  func clearDataSourceOnCancel() {
    view?.showActivityIndicator()
    self.recipesHits.removeAll()
    view?.reloadTableView()
    view?.hideActivityIndicator()
  }
  
  func willDisplayLastCell(keyWord: String) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      guard self.toPage - self.lastPage == 15 else { return }
      self.interactor.loadMore(withKeyWord: keyWord, fromPage: self.lastPage, toPage: self.toPage)
    }
  
  }
  
  func fetchedMoreRecipes(newRecipes: [Hits]) {
    newRecipes.forEach({ self.recipesHits.append($0)})
    view?.reloadTableView()
  }
  
  func didSelect(AtIndexPath indexPath: IndexPath) {
    if let recipe = self.recipesHits[indexPath.item].recipe {
      router.navigateToDetailsView(withRecipe: recipe)
    }
  }
  
}
