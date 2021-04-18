//
//  MainOptions.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation
import UIKit

enum MainOptions: String, CaseIterable {
//  case tripDocuments = "Trip Documents"
//  case trailerLocation = "Trailer Location"
//  case workHours = "Work Hours"
//  case driverAvailability = "Driver Availability"
//  case messages = "Messages"
//  case tripList = "Trip List"
//  case support = "Support"
//  case logout = "Logout"
  case first = "first"
  case second = "second"
  case third = "third"
  
  var viewController: UIViewController {
    switch self {
//    case .support: return SupportViewController.createFromStoryboard()
//    case .workHours: return WorkHoursViewController.createFromStoryboard()
//    case .driverAvailability: return DriverAvailabilityMainViewController.createFromStoryboard()
//    case .messages: return MessagingTabBarController.createFromStoryboard()
//    case .trailerLocation: return TrailerLocationViewController.createFromStoryboard()
    default: return TempViewController.createFromStoryboard()
    }
  }
  
//  var availiableRows: Bool {
//    switch self {
//    case .tripDocuments: return UserDefaults.standard.tripDocumentsIsAvailable
//    case .trailerLocation: return UserDefaults.standard.trailerLocationIsAvailable
//    case .workHours: return UserDefaults.standard.workHoursIsAvailable
//    case .driverAvailability: return UserDefaults.standard.driverAvailabilityIsAvailable
//    case .messages: return UserDefaults.standard.messagingIsAvailable
//    case .tripList: return UserDefaults.standard.tripListIsAvailable
//    case .support: return true
//    case .logout: return true
//    }
//  }
  
//  static func availiableCases() -> [DriverMainOptions] {
//    let allCases = DriverMainOptions.allCases
//    var result = [DriverMainOptions]()
//    for elem in allCases {
//      if elem.availiableRows {
//        result.append(elem)
//      }
//    }
//    return result
//  }
  
//  var sideMenuIcon: UIImage? {
//    switch self {
//    case .tripDocuments: return UIImage(named: "trip_doc")
//    case .trailerLocation: return UIImage(named: "trailer_loc")
//    case .workHours: return UIImage(named: "work_hours")
//    case .driverAvailability: return UIImage(named: "driver_availability")
//    case .messages: return UIImage(named: "messages")
//    case .tripList: return UIImage(named: "trip_list")
//    case .support: return UIImage(named: "support")
//    case .logout: return UIImage(named: "logout")
//    }
//  }
}
