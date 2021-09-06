//
//  TimeInfoTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 06/09/2021.
//

import UIKit

class TimeInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var timeColumn: UILabel!
    @IBOutlet var infoColumn: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
