//
//  AppCoordinator.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation
import UIKit

class AppCoordinator: NSObject {
  
  static let shared = AppCoordinator()
  
  public var currentNavigator: UINavigationController?
  public var sideMenu: SideMenuMainViewController?
  
  func start(with window: UIWindow) {
    let startVC = self.instantiate(.rootWithSideMenu)
    currentNavigator = UINavigationController(rootViewController: startVC)
    window.rootViewController = currentNavigator
    window.makeKeyAndVisible()
    self.activateRoot()
  }
  
  func activateRoot() {
//    authorized = true
    self.currentNavigator?.popToRootViewController(animated: false)
    self.currentNavigator?.setNavigationBarHidden(true, animated: true)
    self.push(.rootWithSideMenu)
//    self.registerForServerNotifications()
  }
  
  func push(_ controller: AppViewController, animated: Bool = true) {
    let vc = instantiate(controller)
    self.currentNavigator?.pushViewController(vc, animated: animated)
  }
  
  func present(_ controller: AppViewController, animated: Bool) {
    let vc = instantiate(controller)
//    UIApplication.topViewController()?.present(vc, animated: animated, completion: nil)
  }
  
  private func instantiate(_ controller: AppViewController) -> UIViewController {
    switch controller {
    case .rootWithSideMenu:
      let vc = SideMenuMainViewController.createFromStoryboard()
      self.sideMenu = vc
      return vc
//    case .menu:
//      return SideMenuViewController.createFromStoryboard()
    case .temp:
      let vc = TempViewController.createFromStoryboard()
      return vc
    }
  }
}
