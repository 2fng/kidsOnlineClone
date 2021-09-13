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

    // MARK: - viewDidLoad()
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

    //Return number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //Return number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowContents.count+1
    }
    
    //Configure cell for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //If indexPath.row == 0 return AvatarTableViewCell ( Contains cover, avatar, 2 labels, 1 button)
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AvatarTableViewCell.identifier) as! AvatarTableViewCell
            
            
            cell.nameLabel.text = "Me be Cat Tien"
            cell.detailLabel.text = "Tai khoan: phuhuynh39"
            
            
            return cell
        }
        //Else return ButtonTableViewCell contains 1 image and 1 label
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
        
        cell.buttonLabel.text = rowContents[indexPath.row-1]["title"]
        cell.buttonImage.image = UIImage(systemName: rowContents[indexPath.row-1]["image"]!)
        cell.buttonImage.tintColor = .orange
        
        //Hide single line separator
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //If Avatarcell return 300 height for row
        if indexPath.row == 0 {
            return 300
        }
        
        //Return 70 height for row
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            print("You tapped avatar and cover row")
        }
        
        else {
            print("You tapped \(rowContents[indexPath.row-1]["title"] ?? "Can't find title")")
        }
    }
    
}
