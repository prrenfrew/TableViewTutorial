//
//  TableViewCell.swift
//  TableViewTutorial
//
//  Created by MAC on 11/30/20.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var todoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.todoLabel.text = ""
  }
}
