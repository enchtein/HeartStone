//
//  CardsTarget.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation
import Moya

enum CardsTarget {
  case getAllCards
}

extension CardsTarget: TargetType {
  var baseURL: URL {
    return URL(string: "https://us.api.blizzard.com/hearthstone/")!
  }
  
  var path: String {
    switch self {
    case .getAllCards:
      return "cards"
    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    var parameters = [String:Any]()
    switch self {
    case .getAllCards:
      parameters["locale"] = "en_US"
      parameters["access_token"] = "USNALHXZZh5yU8YFLQsbquXwZzo7sKEihZ"
    }
    return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
  }
  
  var headers: [String : String]? {
    var dictionary = [String: String]()
    dictionary["Content-Type"] = "application/json"
    return dictionary
  }
  
  
}
