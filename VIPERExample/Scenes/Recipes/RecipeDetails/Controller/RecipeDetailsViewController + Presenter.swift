//
//  RecipeDetailsViewController + Presenter.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
  
  func setupNavigationTitle(title: String) {
    self.title = title
  }
  
  func setupRecipeImage(image: String) {
    self.mainView.recipeImage = image
  }
  
  func setupRecipeUrl(stringUrl: String) {
    self.mainView.publisherUrl = stringUrl
  }
  
  func setupIngredientsTable(withData: [String]) {
    self.mainView.ingredients = withData
  }
}
