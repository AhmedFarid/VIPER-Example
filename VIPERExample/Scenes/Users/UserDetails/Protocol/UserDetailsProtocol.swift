//
//  UserDetailsProtocol.swift
//  VIPERExample
//
//  Created by Macintosh on 11/09/2022.
//

import Foundation

protocol UserDetailsViewProtocol: AnyObject {
  var presenter: UserDetailsPresenterProtocol! { get set }
  func showLoadingIndicator()
  func hideLoadingIndicator()
  func updateUser(name: String)
}

protocol UserDetailsPresenterProtocol: AnyObject {
  var view: UserDetailsViewProtocol? { get set}
  func viewDidLoad()
}

protocol UserDetailsRouterProtocol {
  
}

