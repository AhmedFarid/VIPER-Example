//
//  RecipesRouter.swift
//  VIPERExample
//
//  Created by Macintosh on 14/09/2022.
//
 
import Foundation
import Alamofire

enum RecipesRouter: URLRequestConvertible {
  case get
  
  var method: HTTPMethod {
    switch self {
    case .get:
      return .get
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .get:
      return nil
    }
  }
  
  var url: URL {
    let relativePath: String?
    switch self {
    case .get:
      relativePath = Constants.userEndpoint
    }
    
    var url = URL(string: Constants.baseUrl)!
    if let relativePath = relativePath {
      url = url.appendingPathComponent(relativePath)
    }
    return url
  }
  
  var encoding: ParameterEncoding {
    return JSONEncoding.default
  }
  
  func asURLRequest() throws -> URLRequest {
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    return try encoding.encode(urlRequest, with: parameters)
  }
}
