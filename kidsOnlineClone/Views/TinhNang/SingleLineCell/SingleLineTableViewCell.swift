//
//  SingleLineTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class SingleLineTableViewCell: UITableViewCell {
    
    static let identifier = "singleLineCell"
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SingleLineTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
