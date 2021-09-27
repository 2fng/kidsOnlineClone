//
//  DiningTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 27/09/2021.
//

import UIKit

class DiningTableViewCell: UITableViewCell {

    static let identifier = "diningCell"
    
    @IBOutlet var mealIcon: UIImageView!
    @IBOutlet var verticalLine: UIView!
    @IBOutlet var mealLabel: UILabel!
    @IBOutlet var mealTime: UILabel!
    @IBOutlet var mealDetail: UILabel!
    
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
