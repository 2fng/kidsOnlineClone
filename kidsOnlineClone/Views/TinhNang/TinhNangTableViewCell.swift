//
//  TinhNangTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class TinhNangTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var tinhNangCollectionView: UICollectionView!
    static var identifier = "TinhNangTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TinhNangTableViewCell", bundle: nil)
    }
    
    func setUpCollectionView() {
        tinhNangCollectionView.register(ButtonsCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
    }
    
    func setupCollectionView(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        tinhNangCollectionView.dataSource = dataSourceDelegate
        tinhNangCollectionView.delegate = dataSourceDelegate
        tinhNangCollectionView.tag = row
        tinhNangCollectionView.reloadData()
    }
    
}
