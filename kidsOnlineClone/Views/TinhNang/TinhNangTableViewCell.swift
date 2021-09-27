//
//  TinhNangTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

//Contents buttonCollectionView cell.

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
    //Change page according to x offSet. When x/(contentView.frame.width-20) == 1 => page 1. x/(contentView.frame.width-20) == 2 => page 2
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
    
    
    //There are 13 buttons, split into 2 different pages. 12 on page 1, 1 button on page 2 => Split CollectionView into 2 section, section 1 containts 12 buttons (using ButtonContentCollectionViewCell), section 2 containts 1 button (using ButtonContentCollectionViewCell1)
    
    //Buttons in both ButtonContentCollectionViewCell and ButtonContentCollectionViewCell1 are using ButtonCell in Views/TinhNang/ButtonCell
    
    //Buttons in collectionView displayed verticaly
    
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
