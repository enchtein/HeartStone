//
//  UIStroyboard+Extension.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import UIKit

extension UIStoryboard {
  public func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
    return instantiateViewController(withIdentifier: String(describing: name)) as? T
  }
}

extension UIWindow {
  func topViewController() -> UIViewController? {
    var top = self.rootViewController
    while true {
      if let presented = top?.presentedViewController {
        top = presented
      } else if let nav = top as? UINavigationController {
        top = nav.visibleViewController
      } else if let tab = top as? UITabBarController {
        top = tab.selectedViewController
      } else {
        break
      }
    }
    if let menu = top as? SideMenuViewController, !menu.onScreen {
      return menu.rootController
    }
    return top
  }
}
