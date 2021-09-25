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
    var isLoadMore: Bool = true
    
    var headers: HTTPHeaders = HTTPHeaders([
                "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQwOTkyNywiaXNzIjoiaHR0cDovL21udm4ua28uZWR1LnZuL2FwaS92NC9ndWFyZGlhbi9sb2dpbiIsImlhdCI6MTYzMjI5ODI5MywiZXhwIjoxNjM3NDgyMjkzLCJuYmYiOjE2MzIyOTgyOTMsImp0aSI6IlJYYVVMUUtvSVEwb25jMWwifQ.6vz2trRzlYspDjlF2q9uS2x8KDg5yokSEQmD1TvRJ2M"
            ])
    
//    let editButton = UIBarButtonItem(image: UIImage(systemName: "pencil.circle"), style: .plain, target: self, action: #selector(editButtonIsTapped(sender: )))
    
    let editButton = UIBarButtonItem()
    
    var notifications: [Notification] = []
    var isReadNotifications: [String] = []
    var isDeletedNotifications: [String] = []
    
    
    //Create refresh control variable
    let thongBaoViewRefreshControl: UIRefreshControl =  {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        return refreshControl
    }()
    
    @objc private func refresh(sender: UIRefreshControl) {
        
        fetchData()
        
        tableView.reloadData()
        
        sender.endRefreshing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        //Set up right bar button
        navigationItem.rightBarButtonItem = editButton
        editButton.image = UIImage(systemName: "pencil.circle")
        editButton.style = .plain
        editButton.target = self
        editButton.action = #selector(editButtonIsTapped(sender:))

        
        //Set up tableview
        tableView.register(ThongBaoTableViewCell.nib(), forCellReuseIdentifier: ThongBaoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = thongBaoViewRefreshControl
        
        
        
    }
    
    @objc func editButtonIsTapped(sender: UIBarButtonItem) {
        
        print("Edit button is tapped")
        
        let optionMenu = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        
        let readAll = UIAlertAction(title: "Đã đọc tất cả", style: .default, handler: readAllButtonIsTapped(sender: ))
        optionMenu.addAction(readAll)
        
        let deleteAll = UIAlertAction(title: "Xoá tất cả", style: .default, handler: nil)
        optionMenu.addAction(deleteAll)
        
        let cancelAction = UIAlertAction(title: "Bỏ qua", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        present(optionMenu, animated: true, completion: nil)
    }
    
    func readAllButtonIsTapped(sender: UIAlertAction) {
        
        //If notifications object.is_read == false,
        notifications.filter({ $0.is_read == false }).forEach({ noti in
            
            
            if let pos = isReadNotifications.firstIndex(where: { $0 == noti.notification_id }) {
                isReadNotifications[pos] = noti.notification_id
            } else {
                
                isReadNotifications.append(noti.notification_id)
            }
            
        })
        
        isReadStatusUpdate()
        tableView.reloadData()
    }
    
    func deleteAllButtonIsTapped(sender: UIAlertAction) {
        //
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ThongBaoTableViewCell.identifier, for: indexPath) as! ThongBaoTableViewCell
        
        if notifications[indexPath.row].is_delete == 0 {
            
            
            
            cell.thongBaoImageView?.image = UIImage(named: notifications[indexPath.row].avatar)
            cell.thongBaoTitle.text = notifications[indexPath.row].title
            cell.thongBaoDetail.text = notifications[indexPath.row].sub_title
            cell.thongBaoDetail.lineBreakMode = .byTruncatingTail
            cell.thongBaoDetail.numberOfLines = 1
            cell.thongBaoDateTime.text = "\(notifications[indexPath.row].date)"
            
//            if notifications[indexPath.row].is_read == false {
//                cell.contentView.backgroundColor = .lightGray
//            } else {
//                isReadNotifications.append(notifications[indexPath.row].notification_id)
//                cell.contentView.backgroundColor = nil
//            }
            
            cell.contentView.backgroundColor = notifications[indexPath.row].is_read ? nil : .lightGray
            
            
            return cell
        }
        
        cell.isHidden = true
        
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
        notifications[indexPath.row].is_read = true
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
            
            isDeletedNotifications.append(notifications[indexPath.row].notification_id)
            isDeletedNotification()
            notifications[indexPath.row].is_delete = 1
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            notifications.remove(at: indexPath.row)
            tableView.reloadData()
            
            tableView.endUpdates()
        }
    }
    
    //Load more
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        guard (scrollView.contentOffset.y + scrollView.frame.height) > scrollView.contentSize.height else { return }
        
        
        guard isLoadMore else {
            
            print("no more data")
            self.tableView.tableFooterView = nil
            self.tableView.reloadData()
            
            return
            
        }
        
        loadMoreData()
        
        print("Load more data")
        
        self.tableView.tableFooterView = createSpinnerFooter()
        
        tableView.reloadData()
    }
    
    func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        
        spinner.startAnimating()
        
        return footerView
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
                    
                    //print(JSON)
                    
                    //Parse from dictionary to data
                    let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
                    
                    //Parse from data to jsonObject
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                    
                    let data = ResponseNotification(data:(json?["data"] as? [String: Any]) ?? [:])
                    
                    self.notifications += data.arrayNotification
                    
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
    
    func loadMoreData() {
        
        let loadMoreParams: [String: Any] = ["load_type": 2, "time": notifications[notifications.count-1].created_at]

        print("Time: ", notifications[notifications.count-1].created_at)
        //print(loadMoreParams)
        //fetch data from url using AF.request
        //First parameter is url string, 2nd is http request method (POST, GET, DELETE,...)
        //parameters: params (line 13)
        //headers: headers (line 15)
        
        //params la nhung tham so api request, trong truong hop nay can chuyen 2 tham so "load_type" va "time"
        //header chua token (luu y nho tu khoa "Bearer")
        
        let request = AF.request("https://notification.mnvn.ko.edu.vn/api/parents/load", method: HTTPMethod(rawValue: "POST"),
            parameters: loadMoreParams,
            encoding: JSONEncoding.default,
            headers: headers)
        
        request.responseJSON { (response) in
            switch response.result {

            case .success(let JSON):
                do {
                    
                    
                    //print(JSON)
                    
                    //Parse from dictionary to data
                    let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
                    
                    //Parse from data to jsonObject
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                    
                    let data = ResponseNotification(data:(json?["data"] as? [String: Any]) ?? [:])
                    
                    print("count data recieved",data.arrayNotification.count)
                    self.isLoadMore = data.arrayNotification.count > 1
                    print("isLoadMore value", self.isLoadMore)
                    
                    data.arrayNotification.forEach({ noti in
                        
                        if let pos = self.notifications.firstIndex(where: { $0.notification_id == noti.notification_id }) {
                            
                            print("Same id")
                            self.notifications[pos] = noti
                            
                            
                        } else {
        
                            print(JSON)
                            self.notifications += data.arrayNotification

                        }
                        
                    })
                    
                    
                    
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
                
                do {
                    //Parse from dictionary to data
                    let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
                    
                    //Parse from data to jsonObject
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                    
                    let data = ResponseIsReadNotification(data:(json?["data"] as? [String: Any]) ?? [:])
                    
                    //If server return notification that has notification_id == notificationId => do nothing
                    //If server return notification that notification_id != notificationId => set notifications[position].is_read = true
                    for notificationId in data.arrayNotificationRead {
                        guard let pos = self.notifications.firstIndex(where: { $0.notification_id == notificationId }) else { return  }
                        
                        self.notifications[pos].is_read = true
                        
                    }
                    
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
    
    //send data, fetch updated is_deleted notifications
    func isDeletedNotification() {
        
        let isDeletedParam: [String: Any] = ["notification_ids": isDeletedNotifications]
        
        let request = AF.download("https://notification.mnvn.ko.edu.vn/api/parents/delete",
                                  method: HTTPMethod(rawValue: "POST"),
                                  parameters: isDeletedParam,
                                  encoding: JSONEncoding.default,
                                  headers: headers)
        
        request.responseJSON { (response) in
            
            switch response.result {
            case .success(let JSON):
                
                print("Response: Success")
                print(JSON)
                
            case.failure(let error as Error):
                
                print("Respose: Failed")
                print(error)
                print("ffertre: \(String(describing: response.response?.statusCode))")
            }
        }
    }
    
    
}
