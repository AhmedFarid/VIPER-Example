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
  func udateView()
}

protocol UserDetailsPresenterProtocol: AnyObject {
  var view: UserDetailsViewProtocol? { get set}
  var userName: String { get }
  func viewDidLoad()
}

protocol UserDetailsRouterProtocol {
  
}
 
protocol userDetailsInteractorInputProtocol: AnyObject {
  var presenter: userDetailsInteractorOutputProtocol? { get set }
}

protocol userDetailsInteractorOutputProtocol: AnyObject {
  
}
