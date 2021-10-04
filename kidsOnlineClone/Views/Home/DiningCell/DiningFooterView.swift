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
    @IBOutlet weak var cellTextView: UITextView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "DiningFooterView", bundle: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 300)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: DiningFooterView.self)
        bundle.loadNibNamed("DiningFooterView", owner: self, options: nil)
        addSubview(cellContentView)

        cellContentView.translatesAutoresizingMaskIntoConstraints = false
        cellContentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        //setup image
        cellImage.image?.withRenderingMode(.alwaysOriginal)
        
        //setup button
        cellButton.titleLabel?.textColor = .white
        cellButton.tintColor = .white
        cellButton.layer.cornerRadius = 15
        cellButton.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.6)
        
        //setUp textField
        cellTextView.returnKeyType = .done
        cellTextView.autocapitalizationType = .words
        cellTextView.autocorrectionType = .no
        cellTextView.layer.borderWidth = 1.0
        cellTextView.layer.borderColor = UIColor.red.cgColor
        cellTextView.layer.cornerRadius = 15
        
    }
    
}
