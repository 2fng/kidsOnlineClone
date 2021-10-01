//
//  DiningHeaderView.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import UIKit

class DiningHeaderView: UIView {

    static let identifier = "DiningHeaderView"
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "DiningHeaderView", bundle: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        cellImage.image?.withRenderingMode(.alwaysOriginal)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: DiningHeaderView.self)
        bundle.loadNibNamed("DiningHeaderView", owner: self, options: nil)
        addSubview(cellContentView)
        
        cellContentView.translatesAutoresizingMaskIntoConstraints = false
        cellContentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
