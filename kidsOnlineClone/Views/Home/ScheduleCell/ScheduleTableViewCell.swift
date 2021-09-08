//
//  ScheduleTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 08/09/2021.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    static var identifier = "scheduleCell"
    
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var title2: UILabel!
    @IBOutlet var date2: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "ScheduleTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
