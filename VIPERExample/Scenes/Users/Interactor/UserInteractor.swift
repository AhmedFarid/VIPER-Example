//
//  UserInteractor.swift
//  VIPERExample
//
//  Created by macbook on 10/09/2022.
//

import Foundation

class UsersInteracor: UsersInteractorInputProtocol {
  
 weak var presenter: UsersInteractorOutputProtocol?

  private let userWorker = UserWorker()
  func getUsers() {
    userWorker.getUsers { [weak self] result in
      guard let self = self else {return}
      switch result {
      case .success(let users):
        self.presenter?.userFetchedSuccessFully(users: users)
      case .failure(let error):
        self.presenter?.userFetchingFailed(with: error)
      }
    }
  }

}
