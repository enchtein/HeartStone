//
//  TempViewController.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import UIKit
import PromiseKit

class TempViewController: UIViewController, StoryboardInitializable {
  
  private var getResult: CardsResponse?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.getAllCards()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  func getAllCards() {
    firstly { CardsAdapter.shared.getAllCards() }.done {
      [weak self] (response) in
      guard let self = self else { return }
      self.getResult = response
    } .catch { (error) in
      debugPrint(error.localizedDescription)
    }
  }
}
