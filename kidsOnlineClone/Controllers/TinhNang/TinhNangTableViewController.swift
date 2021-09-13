//
//  TinhNangTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 13/09/2021.
//

import UIKit

class TinhNangTableViewController: UITableViewController {
    
    let navBarTitle = UIBarButtonItem()
    let navButtonImage = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2.fill"), style: .plain, target: self, action: nil)
        
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
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TinhNangTableViewCell.identifier) as! TinhNangTableViewCell
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.size.height/2
        }
        
        return 50
    }
}
