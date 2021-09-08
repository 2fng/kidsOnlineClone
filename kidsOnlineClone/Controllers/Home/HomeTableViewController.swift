//
//  HomeTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 08/09/2021.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    //Data sample
    var appData = [["date": "08/09/2021", "title": "Hoat dong hoc cua be Cat Tien", "subTitle": "Ke hoach thang 9", "subTitleDetail": "Tuan 1 thang 9 nam 2021", "type": "1"],
                   ["date": "09/09/2021", "title": "Hoat dong hoc cua be Cat Tien", "subTitle": "Ke hoach thang 9", "subTitleDetail": "Tuan 1 thang 9 nam 2021", "type": "1"],
                   ["date": "10/09/2021", "title": "Hoat dong hoc cua be Cat Tien", "subTitle": "Ke hoach thang 9", "subTitleDetail": "Tuan 1 thang 9 nam 2021", "type": "1"]
    ]
    
    var schedule = ["7:00 AM", "8:30 AM", "9:00 AM", "9:45 AM", "10:15 AM", "11:00 AM", "12:00 AM"]
    var activity = ["Don tre, tap the duc", "An sang", "HD ngoai troi", "Hoc nhac", "Hoc toan", "An trua", "Ngu trua"]
    
    //Create navBar Button
    let chatNavButton = UIBarButtonItem(image: UIImage(systemName: "quote.bubble.fill"), style: .plain, target: self, action: nil)
    let callNavButton = UIBarButtonItem(image: UIImage(systemName: "phone"), style: .plain, target: self, action: nil)
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up tableview datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self

        //Set up navigation bar
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.leftBarButtonItem = callNavButton
        navigationItem.rightBarButtonItem = chatNavButton
        navigationItem.titleView = UIImageView(image: UIImage(systemName: "location.circle"))
            
        //register cell
        tableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "scheduleCell")
        
        //Create talbe
        setupTalbeViewHeader()
        
    }
    
    func setupTalbeViewHeader() {
        let header = HeaderView(frame: .zero)
        
        //Set frame size before populate view to have initial size
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        //Recalculate header size after populated the content
        size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
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
    
    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I was tapped")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
