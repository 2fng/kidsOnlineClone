//
//  ThongBaoTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class ThongBaoTableViewCell: UITableViewCell {
    
    @IBOutlet var thongBaoImageView: UIImageView!
    @IBOutlet var thongBaoTitle: UILabel!
    @IBOutlet var thongBaoDetail: UILabel!
    @IBOutlet var thongBaoDateTime: UILabel!
    
    
    static let identifier = "thongBaoCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ThongBaoTableViewCell", bundle: nil)
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
