//
//  ThongBaoTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class ThongBaoTableViewController: UITableViewController {
    
    let editButton = UIBarButtonItem(image: UIImage(systemName: "pencil.circle"), style: .plain, target: self, action: nil)
    
    var notifications = [["image": "image1", "title": "khao sat test 27/07", "detail": "bai khao sat test", "dateTime": "10:52 27/07/2021"],                     ["image": "image2", "title": "khao sat nhu cau hoc ngoai khoa", "detail": "Quy phu huynh vui long tra loi bai khao sat ho tro nha truong len ke hoach mo cac lop ngoai khoa", "dateTime": "10:07 22/07/2021"],
                         ["image": "image3", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image1", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image2", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image3", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image1", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image2", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image3", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image1", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image2", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"],
                         ["image": "image3", "title": "khao sat dich te", "detail": "Phu huynh vui long bam vao thong bao khao sat de tra loi cau hoi", "dateTime": "10:52 27/07/2021"]
    ]
    
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
        
        //Set up right bar button
        navigationItem.rightBarButtonItem = editButton
        
        //Set up tableview
        tableView.register(ThongBaoTableViewCell.nib(), forCellReuseIdentifier: ThongBaoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = thongBaoViewRefreshControl
        
        //MARK: - HTTP Request
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
        
        cell.thongBaoImageView?.image = UIImage(named: notifications[indexPath.row]["image"]!)
        cell.thongBaoTitle.text = notifications[indexPath.row]["title"]
        cell.thongBaoDetail.text = notifications[indexPath.row]["detail"]
        cell.thongBaoDetail.lineBreakMode = .byTruncatingTail
        cell.thongBaoDetail.numberOfLines = 1
        cell.thongBaoDateTime.text = notifications[indexPath.row]["dateTime"]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped \(notifications[indexPath.row]["title"] ?? "Can't find title") on date \(notifications[indexPath.row]["dateTime"] ?? "Can't find date")")
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            notifications.remove(at: indexPath.row)
            
            tableView.endUpdates()
        }
    }
    
    
}
