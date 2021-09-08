//
//  TimeInfoTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 08/09/2021.
//

import UIKit

class TimeInfoTableViewCell: UITableViewCell {
    
    static let identifier = "timeInfoCell"
    
    @IBOutlet var timeColumn: UILabel!
    @IBOutlet var infoColumn: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TimeInfoTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
