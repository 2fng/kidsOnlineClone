//
//  DiningFooterView.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 02/10/2021.
//

import UIKit

class DiningFooterView: UIView {
    
    static let identifier = "footerViewCell"

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "DiningFooterView", bundle: nil)
    }
    
}
