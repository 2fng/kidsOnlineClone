//
//  TaiKhoanTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 10/09/2021.
//

import UIKit

class TaiKhoanTableViewController: UITableViewController {
    
    enum rowContent: CaseIterable {
        case avatar, hoSo, thongTinTaiKhoan, thongtinKidsOnline, huongDanSuDung, gopY, doiMatKhau, caiDat, dangXuat
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(AvatarTableViewCell.nib(), forCellReuseIdentifier: AvatarTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowContent.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AvatarTableViewCell.identifier) as! AvatarTableViewCell
            
            
            cell.nameLabel.text = "Me be Cat Tien"
            cell.detailLabel.text = "Tai khoan: phuhuynh39"
            
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        
        return 50
    }
    
}
