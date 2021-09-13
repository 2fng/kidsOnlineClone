//
//  TinhNangTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class TinhNangTableViewController: UITableViewController {
    
    //Create variables for navBarTitle and navBarImage
    let navBarTitle = UIBarButtonItem()
    let navButtonImage = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2.fill"), style: .plain, target: self, action: nil)
    
    //Cell array
    let cellArray = ["buttonCell", "bookCell", "singleCell", "singleCell", "postCell"]
    
    //Create variables for singleLineCell
    let singleLineCellContents = [
        ["image": "gift.fill", "title": "Quà tặng từ KidsOnline", "imageTintColor": "red"],
        ["image": "person.crop.circle.badge.questionmark", "title": "Cha mẹ cần biết", "imageTintColor": "systemPink"]
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up navBar title
        navBarTitle.title = "Tương tác với nhà trường"
        navBarTitle.tintColor = .black

        //Set up navigation bar
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = ""
        navigationItem.leftBarButtonItems = [navButtonImage, navBarTitle]
        
        //Register cell
        tableView.register(TinhNangTableViewCell.nib(), forCellReuseIdentifier: TinhNangTableViewCell.identifier)
        tableView.register(BookTableViewCell.nib(), forCellReuseIdentifier: BookTableViewCell.identifier)
        tableView.register(SingleLineTableViewCell.nib(), forCellReuseIdentifier: SingleLineTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if cellArray[indexPath.row]  == "buttonCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: TinhNangTableViewCell.identifier) as! TinhNangTableViewCell
            
            return cell
        }
        
        if cellArray[indexPath.row]  == "bookCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier) as! BookTableViewCell
            
            cell.cellButton.layer.cornerRadius = 15
            
            return cell
        }
        
        if cellArray[indexPath.row]  == "singleCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: SingleLineTableViewCell.identifier) as! SingleLineTableViewCell
            
            cell.cellImage?.image = UIImage(systemName: singleLineCellContents[indexPath.row-2]["image"]!)
            cell.cellLabel.text = singleLineCellContents[indexPath.row-2]["title"]
            if singleLineCellContents[indexPath.row-2]["imageTintColor"] == "red" {
                cell.cellImage.tintColor = UIColor.systemRed
            } else {
                cell.cellImage.tintColor = UIColor.systemPink
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cellArray[indexPath.row] == "buttonCell" {
            return view.frame.size.height/2
        }
        
        if cellArray[indexPath.row] == "bookCell" {
            return 150
        }
        
        if cellArray[indexPath.row] == "singleCell" {
            return 80
        }
        
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
