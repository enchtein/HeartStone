//
//  StoryboardInitializable.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation
import UIKit

protocol StoryboardInitializable {
  static var storyboardName: String { get }
  static var storyboardBundle: Bundle? { get }
  
  static func createFromStoryboard() -> Self
}

extension StoryboardInitializable where Self : UIViewController {
  
  static var storyboardName: String {
    return "Main"
  }
  
  static var storyboardBundle: Bundle? {
    return nil
  }
  
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
  
  static func createFromStoryboard() -> Self {
    let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
  }
  
}

extension StoryboardInitializable where Self : SideMenuMainViewController {
    static var storyboardName: String {
        return "Main"
    }
}

extension StoryboardInitializable where Self : SideMenuViewController {
    static var storyboardName: String {
        return "Sidemenu"
    }
}
extension StoryboardInitializable where Self : TempViewController {
    static var storyboardName: String {
        return "Temp"
    }
}
extension StoryboardInitializable where Self : CardInfoViewController {
    static var storyboardName: String {
        return "CardInfo"
    }
}
