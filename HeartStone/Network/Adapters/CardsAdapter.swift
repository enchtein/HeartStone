//
//  CardsAdapter.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation
import PromiseKit
import Moya

class CardsAdapter {
  static private let provider: MoyaProvider<CardsTarget> = {
    let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
    let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
    return MoyaProvider<CardsTarget>(plugins: [networkLogger])
  }()
  
  static let shared = CardsAdapter()
  
  private init() {}
  
  func getAllCards() -> Promise<CardsResponse> {
    return Promise { seal in
      CardsAdapter.provider.request(.getAllCards) { (result) in
        switch result {
        case let .success(moyaResponse):
          do {
            switch moyaResponse.statusCode {
            case 200:
              let logdata = try JSONDecoder().decode(CardsResponse.self, from: moyaResponse.data)
              if logdata.pageCount == 0 {
//                seal.reject(ErrorResponse(with: "Empty Session"))
                print("Error 200")
              } else {
                seal.fulfill(logdata)
              }
            case 500:
//              let errorData = try JSONDecoder().decode(ErrorResponse.self, from: moyaResponse.data)
//              seal.reject(errorData)
              print("Error 500")
            default:
//              let errorText = String(data: moyaResponse.data, encoding: .utf8) ?? "Server Error"
//              let errorResponse = ErrorResponse(with: errorText)
//              seal.reject(errorResponse)
              print("Error default")
            }
          } catch let error {
            debugPrint(error.localizedDescription)
            seal.reject(error)
          }
        case let .failure(error):
          debugPrint(error.localizedDescription)
          seal.reject(error)
        }
      }
    }
  }
}
