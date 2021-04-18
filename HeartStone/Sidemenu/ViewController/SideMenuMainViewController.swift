//
//  SideMenuMainViewController.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import UIKit
import SideMenu

class SideMenuMainViewController: UIViewController, StoryboardInitializable {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var navTitle: UINavigationItem!
  @IBOutlet weak var menuButton: UIBarButtonItem!
  
  weak var sideMenuNavigation: SideMenuNavigationController? = nil
  
  var activeController: UIViewController? {
    didSet {
      remove(asChildViewController: oldValue)
      updateActiveViewController()
      sideMenuNavigation?.dismiss(animated: true)
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.defaultVC()
    }
    
  private func defaultVC() {
    let defaultVC = TempViewController.createFromStoryboard()
    self.activeController = defaultVC
    self.navTitle.title = defaultVC.title
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
    self.sideMenuNavigation = sideMenuNavigationController
    sideMenuNavigationController.settings = makeSettings()
    if let sideTableVC = sideMenuNavigationController.topViewController as? SideMenuViewController {
      sideTableVC.rootController = self
    }
  }
  
  public func updateActiveViewController() {
    guard let activeVC = self.activeController else { return }
    self.addChild(activeVC)
    activeVC.view.frame = self.containerView.bounds
    self.containerView.addSubview(activeVC.view)
    activeVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    activeVC.didMove(toParent: self)
    self.view.layoutSubviews()
    self.title = activeVC.title
  }
  
  public func remove(asChildViewController viewController: UIViewController?) {
    viewController?.willMove(toParent: nil)
    viewController?.view.removeFromSuperview()
    viewController?.removeFromParent()
  }
  
  private func setupSideMenu() {
    // Define the menus
    SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController
    
    SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
    SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view, forMenu: .left)
  }
  
  private func updateMenus() {
    let settings = makeSettings()
    SideMenuManager.default.leftMenuNavigationController?.settings = settings
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  private func makeSettings() -> SideMenuSettings {
    let presentationStyle = SideMenuPresentationStyle.menuSlideIn
    presentationStyle.backgroundColor = #colorLiteral(red: 0.1969315112, green: 0.2438022494, blue: 0.3149579763, alpha: 1)
    presentationStyle.menuStartAlpha = 1.0
    presentationStyle.menuScaleFactor = 1.0
    presentationStyle.onTopShadowOpacity = 1.0
    presentationStyle.presentingEndAlpha = 0.4
    presentationStyle.presentingScaleFactor = 1.0
    
    var settings = SideMenuSettings()
    settings.presentationStyle = presentationStyle
    if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
      settings.menuWidth = min(view.frame.width, view.frame.height) * 0.4
    } else {
      settings.menuWidth = min(view.frame.width, view.frame.height) * 0.85
    }
    settings.blurEffectStyle = nil
    settings.statusBarEndAlpha = 0
    
    return settings
  }

}
