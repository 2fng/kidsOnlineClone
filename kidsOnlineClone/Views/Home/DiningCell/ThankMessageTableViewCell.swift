//
//  ThankMessageTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 04/10/2021.
//

import UIKit

class ThankMessageTableViewCell: UITableViewCell {
    
    static let identifier = "thankMessageCell"
    
    @IBOutlet weak var cellTextView: UITextView!
    @IBOutlet weak var cellSubmitButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setUpView()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ThankMessageTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpView() {
        
        contentView.backgroundColor = .systemGray6
        
        cellTextView.layer.borderWidth = 1
        cellTextView.layer.borderColor = UIColor.red.cgColor
        cellTextView.layer.cornerRadius = 15
        
        cellSubmitButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.60)
        cellSubmitButton.layer.cornerRadius = 15
        cellSubmitButton.titleLabel?.textColor = .white
        cellSubmitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
    }
    
}
