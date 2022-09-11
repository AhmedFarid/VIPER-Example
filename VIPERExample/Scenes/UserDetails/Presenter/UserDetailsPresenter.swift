//
//  UserDetailsPresenter.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import Foundation

class UserDetailsPresenter: UserDetailsPresenterProtocol {
  
  weak var view: UserDetailsViewProtocol?
  private let router: UserDetailsRouterProtocol
  private var user: User
    
  init(view: UserDetailsViewProtocol, router: UserDetailsRouterProtocol,user: User) {
    self.view = view
    self.router = router
    self.user = user
  }
  
  func viewDidLoad() {
    view?.showLoadingIndicator()
    view?.updateUser(name: user.username ?? "")
    view?.hideLoadingIndicator()
  }
}
