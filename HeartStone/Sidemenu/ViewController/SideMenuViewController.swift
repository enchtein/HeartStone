//
//  SideMenuViewController.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import UIKit

class SideMenuViewController: UIViewController {
  
  var dataSource = MainOptions.allCases
  weak var rootController: SideMenuMainViewController? = nil
  var onScreen: Bool = true
  
  @IBOutlet weak var sideMenuTableView: UITableView!
//  let mass = ["label_1", "label_2", "label_3"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.sideMenuTableView.delegate = self
    self.sideMenuTableView.dataSource = self
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return self.mass.count
    return self.dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as? SideMenuTableViewCell {
//      cell.cellLabel.text = self.mass[indexPath.row]
      cell.cellLabel.text = self.dataSource[indexPath.row].rawValue
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let item = self.mass[indexPath.row]
    let item = self.dataSource[indexPath.row]
    guard type(of: item.viewController) != type(of: self.rootController?.activeController ?? UIViewController()) else {
      self.dismiss(animated: true)
      return
    }
    self.rootController?.activeController = item.viewController
    self.rootController?.navTitle.title = item.rawValue
  }
}
