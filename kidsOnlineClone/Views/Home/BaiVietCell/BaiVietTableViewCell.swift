//
//  BaiVietTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 10/09/2021.
//

import UIKit

class BaiVietTableViewCell: UITableViewCell {
    
    static let identifier = "baiVietCell"
    
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var thumbNailImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BaiVietTableViewCell", bundle: nil)
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
