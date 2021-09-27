//
//  DiningTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 27/09/2021.
//

import UIKit

class DiningTableViewCell: UITableViewCell {

    static let identifier = "diningCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DiningTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
