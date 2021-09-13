//
//  PostCollectionViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "postCollectionCell"
    
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    @IBOutlet weak var cellLikeButton: UIButton!
    @IBOutlet weak var buttonLikeCounter: UILabel!
    @IBOutlet weak var cellCommentLabel: UILabel!
    @IBOutlet weak var cellCommentCounter: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PostCollectionViewCell", bundle: nil)
    }

}
