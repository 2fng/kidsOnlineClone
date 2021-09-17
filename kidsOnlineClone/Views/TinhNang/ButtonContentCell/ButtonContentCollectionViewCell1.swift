//
//  ButtonContentCollectionViewCell1.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 17/09/2021.
//

import UIKit

class ButtonContentCollectionViewCell1: UICollectionViewCell {
    
    static let identifier = "buttonContentCollectionViewCell1"
    
    var cellContents = [["image": "tray.2", "title": "Dang ky an"]]
    
    @IBOutlet weak var buttonContentCollectionCell1: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        buttonContentCollectionCell1.register(ButtonsCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
        
        buttonContentCollectionCell1.dataSource = self
        buttonContentCollectionCell1.delegate = self
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonContentCollectionViewCell1", bundle: nil)
    }

}

extension ButtonContentCollectionViewCell1: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCollectionViewCell.identifier, for: indexPath) as! ButtonsCollectionViewCell
        
        cell.buttonImage.setImage(UIImage(systemName: cellContents[indexPath.item]["image"]!), for: .normal)
        cell.buttonLabel.text = cellContents[indexPath.item]["title"] ?? "Unknown"
        
        return cell
    
    }
}

extension ButtonContentCollectionViewCell1: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You tapped \(cellContents[indexPath.item]["title"])")
    }
}

extension ButtonContentCollectionViewCell1: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 80)
    }
}
