//
//  DiningButtonTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 02/10/2021.
//

import UIKit

class DiningButtonTableViewCell: UITableViewCell {

    static let identifier = "diningButtonCell"
    
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var cellStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
        // Initialization code
        
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DiningButtonTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureButton() {
        
        cellButton.titleLabel?.textColor = .white
        cellButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cellButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.6)
        cellButton.layer.cornerRadius = 15
        
        
        buttonImage.clipsToBounds = true
        cellStackView.bringSubviewToFront(buttonImage)
        contentView.backgroundColor = .systemGray6
    }
}
