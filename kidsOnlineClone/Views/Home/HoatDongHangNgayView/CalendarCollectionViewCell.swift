//
//  CalendarCollectionViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 27/09/2021.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    static let identifier = "calendarCollectionView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CalendarCollectionViewCell", bundle: nil)
    }

}
