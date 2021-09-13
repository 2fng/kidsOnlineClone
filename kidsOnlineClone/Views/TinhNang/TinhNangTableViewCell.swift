//
//  TinhNangTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class TinhNangTableViewCell: UITableViewCell {
    
    let cellContents = [
        ["image": "bubble.left.and.bubble.right", "title": "Loi nhan"],
        ["image": "text.book.closed", "title": "Xin nghi"],
        ["image": "bag.badge.plus", "title": "Dan thuoc"],
        ["image": "car", "title": "Don ve"],
        ["image": "calendar.badge.clock", "title": "Hoat dong hang ngay"],
        ["image": "newspaper", "title": "Tin tuc"],
        ["image": "person.2.square.stack", "title": "Album anh"],
        ["image": "dollarsign.square", "title": "Hoc phi"],
        ["image": "apps.iphone.badge.plus", "title": "Suc khoe"],
        ["image": "bubble.left.and.bubble.right", "title": "Ngoai khoa"],
        ["image": "text.badge.checkmark", "title": "Khao sat"],
        ["image": "character", "title": "Danh gia dinh ky"],
        ["image": "tray.2", "title": "Dang ky an"]
    ]
    
    @IBOutlet private weak var tinhNangCollectionView: UICollectionView!
    static var identifier = "TinhNangTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        tinhNangCollectionView.register(ButtonsCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
        tinhNangCollectionView.delegate = self
        tinhNangCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TinhNangTableViewCell", bundle: nil)
    }
    
}

//MARK: - Collection view delegate
extension TinhNangTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//MARK: - Collection view data source
extension TinhNangTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellContents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCollectionViewCell.identifier, for: indexPath) as! ButtonsCollectionViewCell
        
        cell.buttonImage.setImage(UIImage(systemName: cellContents[indexPath.item]["image"]!), for: .normal)
        cell.buttonLabel.text = cellContents[indexPath.item]["title"] ?? "Unknown"
        
        return cell
    }
    
    
}

//MARK: - Collection view delegate flow layout
extension TinhNangTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
