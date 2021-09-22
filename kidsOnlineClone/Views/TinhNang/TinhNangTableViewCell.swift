//
//  TinhNangTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class TinhNangTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet private weak var tinhNangCollectionView: UICollectionView!
    @IBOutlet private weak var tinhNangPageControl: UIPageControl!
    
    static var identifier = "TinhNangTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        tinhNangCollectionView.register(ButtonContentCollectionViewCell.nib(), forCellWithReuseIdentifier: ButtonContentCollectionViewCell.identifier)
        tinhNangCollectionView.register(ButtonContentCollectionViewCell1.nib(), forCellWithReuseIdentifier: ButtonContentCollectionViewCell1.identifier)
        
        tinhNangCollectionView.delegate = self
        tinhNangCollectionView.dataSource = self
        
        tinhNangPageControl.currentPage = 0
        tinhNangPageControl.numberOfPages = 2

    }
    
    //Update currentPage
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        print(x, contentView.frame.width, x/(contentView.frame.width-20))
        
        tinhNangPageControl.currentPage = Int(x/(contentView.frame.width-20))
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
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonContentCollectionViewCell.identifier, for: indexPath) as! ButtonContentCollectionViewCell
            
            return cell
        }
        
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonContentCollectionViewCell1.identifier, for: indexPath) as! ButtonContentCollectionViewCell1
            
            return cell
        }
    }
    
    
}

//MARK: - Collection view delegate flow layout
extension TinhNangTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.size.width-20, height: contentView.frame.size.height)
    }
}
