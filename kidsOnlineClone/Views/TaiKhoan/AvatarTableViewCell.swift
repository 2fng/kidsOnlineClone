//
//  AvatarTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 11/09/2021.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    
    static let identifier = "avatarCell"
    
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var editButton: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "AvatarTableViewCell", bundle: nil)
    }
    
    func configurePosition() {
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
