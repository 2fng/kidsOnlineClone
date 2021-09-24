//
//  ThongBaoTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit
import Alamofire

class ThongBaoTableViewController: UITableViewController {
    
    let params: [String: Any] = ["load_type": 1, "time": 0]

    
    var headers: HTTPHeaders = HTTPHeaders([
                "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQwOTkyNywiaXNzIjoiaHR0cDovL21udm4ua28uZWR1LnZuL2FwaS92NC9ndWFyZGlhbi9sb2dpbiIsImlhdCI6MTYzMjI5ODI5MywiZXhwIjoxNjM3NDgyMjkzLCJuYmYiOjE2MzIyOTgyOTMsImp0aSI6IlJYYVVMUUtvSVEwb25jMWwifQ.6vz2trRzlYspDjlF2q9uS2x8KDg5yokSEQmD1TvRJ2M"
            ])
    
    let editButton = UIBarButtonItem(image: UIImage(systemName: "pencil.circle"), style: .plain, target: self, action: nil)
    
    var notifications: [Notification] = []
    var isReadNotifications: [String] = []
    
    //Create refresh control variable
    let thongBaoViewRefreshControl: UIRefreshControl =  {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        return refreshControl
    }()
    
    @objc private func refresh(sender: UIRefreshControl) {
        
        tableView.reloadData()
        
        sender.endRefreshing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        //Set up right bar button
        navigationItem.rightBarButtonItem = editButton
        
        //Set up tableview
        tableView.register(ThongBaoTableViewCell.nib(), forCellReuseIdentifier: ThongBaoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = thongBaoViewRefreshControl
        
        //MARK: - HTTP Request URL and request
        // Create URL Request
        let url = URL(string: "https://notification.mnvn.ko.edu.vn/api/parents/load")!
        var request = URLRequest(url: url)
        
        request.setValue("authToken", forHTTPHeaderField: "Authorization")
        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThongBaoTableViewCell.identifier, for: indexPath) as! ThongBaoTableViewCell
        
        cell.thongBaoImageView?.image = UIImage(named: notifications[indexPath.row].avatar)
        cell.thongBaoTitle.text = notifications[indexPath.row].title
        cell.thongBaoDetail.text = notifications[indexPath.row].sub_title
        cell.thongBaoDetail.lineBreakMode = .byTruncatingTail
        cell.thongBaoDetail.numberOfLines = 1
        cell.thongBaoDateTime.text = "\(notifications[indexPath.row].date)"
        
        if notifications[indexPath.row].is_read == 0 {
            cell.contentView.backgroundColor = .lightGray
        } else {
            isReadNotifications.append(notifications[indexPath.row].notification_id)
            cell.contentView.backgroundColor = nil
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    
    // MARK: - Table view delegate
    
    //Cell is press
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        isReadNotifications.append(notifications[indexPath.row].notification_id)
        isReadStatusUpdate()
        notifications[indexPath.row].is_read = 1
        tableView.reloadData()
        print("You tapped \(notifications[indexPath.row].title) on date \(notifications[indexPath.row].date)")
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //Slide left to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            notifications.remove(at: indexPath.row)
            
            tableView.endUpdates()
        }
    }
    
    
}

// MARK: - HTTP request
extension ThongBaoTableViewController {
    
    enum APIResult {
        case success(Any)
        case failure(APIError)
    }
    
    enum APIError {
        
    }

    func fetchData() {
        //fetch data from url using AF.request
        //First parameter is url string, 2nd is http request method (POST, GET, DELETE,...)
        //parameters: params (line 13)
        //headers: headers (line 15)
        
        //params la nhung tham so api request, trong truong hop nay can chuyen 2 tham so "load_type" va "time"
        //header chua token (luu y nho tu khoa "Bearer")
        
        let request = AF.request("https://notification.mnvn.ko.edu.vn/api/parents/load", method: HTTPMethod(rawValue: "POST"),
            parameters: params,
            encoding: JSONEncoding.default,
            headers: headers)
        
        request.responseJSON { (response) in
            switch response.result {

            case .success(let JSON):
                do {
                    //Parse from dictionary to data
                    let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
                    
                    //Parse from data to jsonObject
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                    
                    let data = ResponseNotification(data:(json?["data"] as? [String: Any]) ?? [:])
                    
                    self.notifications = data.arrayNotification
                    
                    //print(JSON)
                    self.tableView.reloadData()
                    
                } catch {
                    
                    print(error)
                    
                }
                
            case .failure(let error as Error):
                print("Respose: Failed")
                print(error)
                print("ffertre: \(String(describing: response.response?.statusCode))")

            }
        }
    }
    
    //send data, fetch updated is_read notifications
    func isReadStatusUpdate() {
        
        let isReadParam: [String: Any] = ["notification_ids": isReadNotifications]
        
        let request = AF.request("https://notification.mnvn.ko.edu.vn/api/parents/read",
                                 method: HTTPMethod(rawValue: "POST"),
                                 parameters: isReadParam,
                                 encoding: JSONEncoding.default,
                                 headers: headers)
        
        request.responseJSON { (response) in
            
            switch response.result {
            case .success(let JSON):
                
                print(JSON)
                
            case .failure(let error as Error):
                
                print("Respose: Failed")
                print(error)
                print("ffertre: \(String(describing: response.response?.statusCode))")
            }
        }
    }
}
