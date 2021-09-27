//
//  HoatDongHangNgayViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 27/09/2021.
//

import UIKit

class HoatDongHangNgayViewController: UIViewController {
    
    private let scheDuleDate = [
        ["day": "CN", "date": "05/09"],
        ["day": "thu 2", "date": "06/09"],
        ["day": "thu 3", "date": "07/09"],
        ["day": "thu 4", "date": "08/09"],
        ["day": "thu 5", "date": "09/09"],
        ["day": "thu 5", "date": "10/09"],
        ["day": "thu 6", "date": "11/09"],
    ]

    private let dateTitle: String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemGray6
        
        
        //Navigation bar set up
        
        let heartCalendarImage = UIImage(named: "heartCalendar")
        let rightNavBarButton = UIBarButtonItem(image: heartCalendarImage, style: .plain, target: self, action: nil)
        rightNavBarButton.tintColor = nil
        
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationItem.title = dateTitle
        self.navigationItem.rightBarButtonItem = rightNavBarButton
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
