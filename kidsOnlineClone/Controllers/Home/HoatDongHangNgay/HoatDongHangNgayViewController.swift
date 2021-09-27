//
//  HoatDongHangNgayViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 27/09/2021.
//

import UIKit

class HoatDongHangNgayViewController: UIViewController {
    
    private let scheDuleDates = [
        ["day": "CN", "date": "05/09"],
        ["day": "thu 2", "date": "06/09"],
        ["day": "thu 3", "date": "07/09"],
        ["day": "thu 4", "date": "08/09"],
        ["day": "thu 5", "date": "09/09"],
        ["day": "thu 6", "date": "10/09"],
        ["day": "thu 7", "date": "11/09"],
    ]

    private let dateTitle: String
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Register nib for CollectionView
        collectionView.register(CalendarCollectionViewCell.nib(), forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemGray6
        
        
        //Navigation bar set up
        let heartCalendarImage = UIImage(named: "heartCalendar")
        let rightNavBarButton = UIBarButtonItem(image: heartCalendarImage, style: .plain, target: self, action: nil)
        
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationItem.title = dateTitle
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        //Set up collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    init(date: String) {
        
        self.dateTitle = date
        super.init(nibName: "HoatDongHangNgayViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getDateHoatDongHangNgay(date: String) {
        
        self.navigationItem.title = date
        print(date)
    }
    
    
}

extension HoatDongHangNgayViewController: UICollectionViewDelegate {
    
}

extension HoatDongHangNgayViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheDuleDates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as! CalendarCollectionViewCell
        
        if scheDuleDates[indexPath.item]["date"] == "09/09" {
            cell.dateContentView.backgroundColor = UIColor(red: 0, green: 0, blue: 50, alpha: 0.75)
        } else {
            cell.dateContentView.backgroundColor = UIColor(red: 0, green: 0, blue: 50, alpha: 0.6)
        }
        
        cell.dateContentView.layer.cornerRadius = 5
        cell.dayLabel.text = scheDuleDates[indexPath.item]["day"]
        cell.dayLabel.textColor = .white
        cell.dateLabel.textColor = .white
        cell.dateLabel.text = scheDuleDates[indexPath.item]["date"]
        
        return cell
    }
    
    
}

extension HoatDongHangNgayViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
