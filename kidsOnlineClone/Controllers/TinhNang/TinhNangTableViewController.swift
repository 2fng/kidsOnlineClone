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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
