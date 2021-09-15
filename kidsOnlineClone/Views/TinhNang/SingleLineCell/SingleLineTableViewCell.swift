//
//  SingleLineTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class SingleLineTableViewCell: UITableViewHeaderFooterView {
    
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
    
}
