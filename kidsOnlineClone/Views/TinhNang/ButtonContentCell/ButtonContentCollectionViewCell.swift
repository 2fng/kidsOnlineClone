//
//  ButtonContentCollectionViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 17/09/2021.
//

import UIKit

class ButtonContentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "buttonContentCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonContentCollectionViewCell", bundle: nil)
    }

}
