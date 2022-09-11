//
//  UserDetailsPresenter.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import Foundation

class UserDetailsPresenter: UserDetailsPresenterProtocol, userDetailsInteractorOutputProtocol {
  
 
  weak var view: UserDetailsViewProtocol?
  private let interactor: userDetailsInteractorInputProtocol
  private let router: UserDetailsRouterProtocol
  
  var userName: String {
    return ""
  }
  
  
  init(view: UserDetailsViewProtocol, interactor: userDetailsInteractorInputProtocol, router: UserDetailsRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
  
  func viewDidLoad() {
    // get userDetails data
    view?.showLoadingIndicator()
    // interactor.getData()
  }
}
