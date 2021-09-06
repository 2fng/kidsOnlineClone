//
//  HomeTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 06/09/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    //DateLabel View
    @IBOutlet var dateLabelView: UIView!
    @IBOutlet var scheduleDateLabel: UILabel!
    
    //Schedule View
    @IBOutlet var scheduleView: UIView!
    @IBOutlet var scheduleLabel: UILabel!
    @IBOutlet var scheduleLabelDate: UILabel!
    @IBOutlet var scheduleWeek: UILabel!
    @IBOutlet var scheduleWeekDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
