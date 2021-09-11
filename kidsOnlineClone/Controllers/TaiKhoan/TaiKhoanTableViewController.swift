//
//  TaiKhoanTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 10/09/2021.
//

import UIKit

class TaiKhoanTableViewController: UITableViewController {
    
    //language button
    let languageNavButton = UIBarButtonItem(image: UIImage(systemName: "flag.badge.ellipsis.fill"), style: .plain, target: self, action: nil)
    
    //Create cases for the tableview buttons
    let rowContents = [
        ["title": "Ho so cua be", "image": "newspaper.fill"],
        ["title": "Thong tin tai khoan", "image": "person.crop.circle"],
        ["title": "Thong tin ve KidsOnline", "image": "bubble.left.and.bubble.right.fill"],
        ["title": "Huong dan su dung", "image": "info.circle.fill"],
        ["title": "Gop y ung dung", "image": "rectangle.and.pencil.and.ellipsis"],
        ["title": "Doi mat khau", "image": "key"],
        ["title": "Cai dat", "image": "gearshape"],
        ["title": "Dang xuat", "image": "eject.circle"]
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up navigation bar
        navigationItem.rightBarButtonItem = languageNavButton
        languageNavButton.tintColor = .orange
        
        
        //Register Cell
        tableView.register(AvatarTableViewCell.nib(), forCellReuseIdentifier: AvatarTableViewCell.identifier)
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: ButtonTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowContents.count+1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AvatarTableViewCell.identifier) as! AvatarTableViewCell
            
            
            cell.nameLabel.text = "Me be Cat Tien"
            cell.detailLabel.text = "Tai khoan: phuhuynh39"
            
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
        
        cell.buttonLabel.text = rowContents[indexPath.row-1]["title"]
        cell.buttonImage.image = UIImage(systemName: rowContents[indexPath.row-1]["image"]!)
        cell.buttonImage.tintColor = .orange
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }
        
        return 70
    }
    
}
