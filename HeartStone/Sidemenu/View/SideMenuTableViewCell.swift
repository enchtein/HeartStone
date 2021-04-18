//
//  SideMenuTableViewCell.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
  
  @IBOutlet weak var cellImageView: UIImageView!
  @IBOutlet weak var cellLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
