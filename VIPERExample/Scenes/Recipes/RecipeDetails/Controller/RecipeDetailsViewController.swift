//
//  RecipeDetailsViewController.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
  
  var presenter: RecipeDetailsPresenterProtocol!
  
  lazy var mainView: RecipeDetailsContainer = {
    var view = RecipeDetailsContainer()
    return view
  }()
  
  override func loadView() {
    super.loadView()
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    setupTableView()
  }
}



