//
//  ButtonsCollectionViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class ButtonsCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "ButtonsCollectionViewCell"
    
    @IBOutlet  weak var buttonImage: UIButton!
    @IBOutlet  weak var buttonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonsCollectionViewCell", bundle: nil)
    }

}
