//
//  ButtonTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 11/09/2021.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    static let identifier = "buttonCell"
    
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var buttonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
