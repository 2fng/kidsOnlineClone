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
    let cellArray = ["buttonCell", "bookCell", "singleCell", "postCell"]
    
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
        //tableView.register(BookTableViewCell.nib(), forCellReuseIdentifier: BookTableViewCell.identifier)
        //tableView.register(SingleLineTableViewCell.nib(), forCellReuseIdentifier: SingleLineTableViewCell.identifier)
        tableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        
        //Register header
        tableView.register(SingleLineTableViewCell.nib(), forHeaderFooterViewReuseIdentifier: SingleLineTableViewCell.identifier)
        tableView.register(BookTableViewCell.nib(), forHeaderFooterViewReuseIdentifier: BookTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return cellArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if cellArray[indexPath.section]  == "buttonCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: TinhNangTableViewCell.identifier) as! TinhNangTableViewCell
            
            return cell
        }
        
        if cellArray[indexPath.section] == "postCell" {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cellArray[indexPath.section] == "buttonCell" {
            return view.frame.size.height/2
        }
        
        if cellArray[indexPath.section] == "bookCell" {
            return 0
        }
        
        if cellArray[indexPath.section] == "singleCell" {
            return 0
        }
        
        return 300
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //section header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if cellArray[section] == "singleCell" || cellArray[section] == "postCell" {
            
            let contentView = UIView()
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SingleLineTableViewCell.identifier) as! SingleLineTableViewCell
            
            view.cellImage?.image = UIImage(systemName: singleLineCellContents[section-2]["image"]!)
            view.cellLabel.text = singleLineCellContents[section-2]["title"]
            
            if singleLineCellContents[section-2]["imageTintColor"] == "red" {
                
                view.cellImage.tintColor = UIColor.systemRed
                
            } else {
                
                view.cellImage.tintColor = UIColor.systemPink
                
            }
            
            contentView.addSubview(view)
            contentView.backgroundColor = .white
            
            return contentView
        }
        
        if cellArray[section] == "bookCell" {
            
            let contentView = UIView()
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: BookTableViewCell.identifier) as! BookTableViewCell
            
            view.cellButton.layer.cornerRadius = 15
            
            contentView.addSubview(view)
            contentView.backgroundColor = .white
            
            return contentView
        }
        
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if cellArray[section] == "singleCell" || cellArray[section] == "postCell" {
            return 80
        }
        
        if cellArray[section] == "bookCell" {
            return 150
        }
        
        return 0
    }
}
