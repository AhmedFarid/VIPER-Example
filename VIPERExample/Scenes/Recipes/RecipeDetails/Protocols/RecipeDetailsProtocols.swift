//
//  RecipeDetailsProtocols.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import Foundation

protocol RecipeDetailsViewProtocol: AnyObject {
  var presenter: RecipeDetailsPresenterProtocol! { get set}
  func setupNavigationTitle(title: String)
  func setupRecipeImage(image: String)
  func setupRecipeUrl(stringUrl: String)
  func setupIngredientsTable(withData: [String])
}

protocol RecipeDetailsPresenterProtocol {
  var view: RecipeDetailsViewProtocol? { get set}
  func viewDidLoad()
}

protocol RecipeDetailsRouterProtocol {}

protocol RecipeDetailsInteractorInPutProtocol {
  var presenter: RecipeDetailsInteractorOutPutProtocol? {get set}
}

protocol RecipeDetailsInteractorOutPutProtocol {
}

