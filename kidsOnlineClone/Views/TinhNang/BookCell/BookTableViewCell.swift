//
//  BookTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class BookTableViewCell: UITableViewHeaderFooterView {
    
    static let identifier = "tinhNangBookCell"
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellImageLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BookTableViewCell", bundle: nil)
    }

    
    
}
