//
//  ButtonContentCollectionViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 17/09/2021.
//

import UIKit

class ButtonContentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "buttonContentCell"
    
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
    
    @IBOutlet weak var buttonContentCollectionViewCell: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        buttonContentCollectionViewCell.register(ButtonsCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
        
        buttonContentCollectionViewCell.delegate = self
        buttonContentCollectionViewCell.dataSource = self
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonContentCollectionViewCell", bundle: nil)
    }

}

extension ButtonContentCollectionViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCollectionViewCell.identifier, for: indexPath) as! ButtonsCollectionViewCell
        
        cell.buttonImage.setImage(UIImage(systemName: cellContents[indexPath.item]["image"]!), for: .normal)
        cell.buttonLabel.text = cellContents[indexPath.item]["title"] ?? "Unknown"
        
        return cell
    
    }
    
    
}

extension ButtonContentCollectionViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You tapped \(cellContents[indexPath.item]["title"])")
    }
}

extension ButtonContentCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
}
