//
//  RecipeDetailsViewController.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
  var presenter: RecipeDetailsPresenterProtocol!
 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
 
}

extension RecipeDetailsViewController: RecipeDetailsViewProtocol {
  
  func setupNavigationTitle(title: String) {
    
  }
  
  func setupRecipeImage(image: String) {
    
  }
  
  func setupRecipeUrl(stringUrl: String) {
    
  }
  
  func setupIngredientsTable(withData: [String]) {
    
  }
  
  
}
