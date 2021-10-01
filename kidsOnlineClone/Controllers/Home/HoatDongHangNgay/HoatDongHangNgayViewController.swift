//
//  HoatDongHangNgayViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 27/09/2021.
//

import UIKit
import Alamofire

class HoatDongHangNgayViewController: UIViewController {
    
    let params: [String: Any] = [
        "student_id": 263267,
        "class_id": 15860,
        "date": 1630602000
    ]
    
    var headers: HTTPHeaders = HTTPHeaders([
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM3MzkwMSwiaXNzIjoiaHR0cDovL21udm4ua28uZWR1LnZuLy9hcGkvdjQvZ3VhcmRpYW4vbG9naW4iLCJpYXQiOjE2MzMwNTkyMzAsImV4cCI6MTYzODI0MzIzMCwibmJmIjoxNjMzMDU5MjMwLCJqdGkiOiJYWkg2WjFTaFAwRVQ0Y25CIn0.O0ygUgMJKKSKdLFuOuuq4Sk2ol7Fyy3fCbKEwHfx0VQ"
    ])
    
    var dinings: [Dining] = []
    var diningDetails: [DiningDetail] = []
    
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
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        fetchData()
        
        print("dinings count: ", diningDetails.count)
        //Register nib for CollectionView
        collectionView.register(CalendarCollectionViewCell.nib(), forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        
        //Register nib for TableView
        tableView.register(DiningTableViewCell.nib(), forCellReuseIdentifier: DiningTableViewCell.identifier)
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemGray6
        
        
        //Navigation bar set up
        let heartCalendarImage = UIImage(named: "heartCalendar")?.withRenderingMode(.alwaysOriginal)
        
        
        let rightNavBarButton = UIBarButtonItem(image: heartCalendarImage, style: .plain, target: self, action: nil)
        
        self.view.backgroundColor = .systemGray6
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.title = dateTitle
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        //Set up collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        
        //Set up tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 5
        //tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .systemGray6
        
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

// MARK: - CollectionView set up
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

// MARK: - TableView set up

extension HoatDongHangNgayViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}

extension HoatDongHangNgayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diningDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DiningTableViewCell.identifier) as! DiningTableViewCell
        
        cell.contentView.backgroundColor = .systemGray6
        
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.cellContentView.backgroundColor = .white
            cell.cellContentView.layer.cornerRadius = 4
            
            cell.mealIcon.image = UIImage(named: "buaSang")
            cell.mealLabel.text = "Bữa sáng".uppercased()
            cell.mealLabel.textColor = UIColor.systemOrange
            cell.mealDetail.text = "\(diningDetails[indexPath.row].content)"
            cell.mealTime.text = "(\(diningDetails[indexPath.row].name))"
            cell.mealTime.textColor = UIColor.systemOrange
        }
        
        if indexPath.row == 1 {
            
            cell.mealIcon.image = UIImage(named: "phuSang")
            cell.mealLabel.text = "Phụ sáng".uppercased()
            cell.mealLabel.textColor = UIColor.systemGreen
            cell.mealDetail.text = "\(diningDetails[indexPath.row].content)"
            cell.mealTime.text = "(\(diningDetails[indexPath.row].name))"
            cell.mealTime.textColor = UIColor.systemGreen
        }
        
        if indexPath.row == 2 {
            cell.mealIcon.image = UIImage(named: "buaSang")
            cell.mealLabel.text = "trưa".uppercased()
            cell.mealLabel.textColor = UIColor.systemRed
            cell.mealDetail.text = "\(diningDetails[indexPath.row].content)"
            cell.mealTime.text = "(\(diningDetails[indexPath.row].name))"
            cell.mealTime.textColor = UIColor.systemRed
        }
        
        if indexPath.row == 3 {
            cell.mealIcon.image = UIImage(named: "buaChieu")
            cell.mealLabel.text = "chiều".uppercased()
            cell.mealLabel.textColor = UIColor.systemBlue
            cell.mealDetail.text = "\(diningDetails[indexPath.row].content)"
            cell.mealTime.text = "(\(diningDetails[indexPath.row].name))"
            cell.mealTime.textColor = UIColor.systemBlue
        }
        
        if indexPath.row == 4 {
            
            cell.cellContentView.layer.cornerRadius = 4
            
            cell.mealIcon.image = UIImage(named: "suaChieu")
            cell.mealLabel.text = "sữa chiều".uppercased()
            cell.mealLabel.textColor = UIColor.systemOrange
            cell.mealDetail.text = "\(diningDetails[indexPath.row].content)"
            cell.mealTime.text = "(\(diningDetails[indexPath.row].name))"
            cell.mealTime.textColor = UIColor.systemOrange
        }
        
        if indexPath.row == 5 {
            //
        }
        
        cell.mealLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cell.mealTime.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
}

extension HoatDongHangNgayViewController {
    
    enum APIResult {
        case success(Any)
        case failure(APIError)
    }
    
    enum APIError {
        
    }
    
    func fetchData() {
        
        let request = AF.request( "https://mnvn.ko.edu.vn//api/v4/guardian/activity/date", method: HTTPMethod(rawValue: "POST"), parameters: params, encoding: JSONEncoding.default, headers: headers)
        
        request.responseJSON { (response) in
            
            switch response.result {
            case.success(let JSON):
                do {
                    
                    print(JSON)
                    
                    //parse from dictionary to data
                    let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
                    
                    //parse from data to jsonObject
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                    
                    //print("print json", json?["data"]!["dining"])
                    
                    let data = ResponseHoatDongHangNgay(data: (json?["data"]!["dining"] as? [String: Any]) ?? [:])
                    
                    print("data print", data)
                    
                    self.diningDetails += data.diningDetailArray
                    
                    print("diningDetails print", self.diningDetails)
                    
                    self.tableView.reloadData()
                    
                } catch {
                    print(error)
                }
             
            case.failure(let error as Error):
                
                print("Respose: Failed")
                print(error)
                print("ffertre: \(String(describing: response.response?.statusCode))")
            }
        }
    }
    
}
