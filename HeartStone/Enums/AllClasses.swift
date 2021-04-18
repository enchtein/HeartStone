//
//  AllClasses.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation
import UIKit

enum AllClasses: String, CaseIterable {
  case allClasses = "All Classes"
  case demonHunter = "Demon Hunter"
  case druid = "Druid"
  case hunter = "Hunter"
  case mage = "Mage"
  case paladin = "Paladin"
  case priest = "Priest"
  case rogue = "Rogue"
  case shaman = "Shaman"
  case warlock = "Warlock"
  case warrior = "Warrior"
  case neutral = "Neutral"
  
  var viewController: UIViewController {
    switch self {
    default: return CardInfoViewController.createFromStoryboard()
    }
  }
}
