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
        
        view.backgroundColor = .lightGray
        
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
        
        //Create table view header
        setupTalbeViewHeader()
        
        //Register Cells
        tableView.register(ScheduleTableViewCell.nib(), forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        tableView.register(TimeInfoTableViewCell.nib(), forCellReuseIdentifier: TimeInfoTableViewCell.identifier)
        
        
    }
    
    func setupTalbeViewHeader() {
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        
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
        return appData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return schedule.count+1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if appData[indexPath.section]["type"] == "1" {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier) as! ScheduleTableViewCell
                
                cell.date.text = appData[indexPath.section]["date"]
                cell.title.text = appData[indexPath.section]["title"]
                cell.date2.text = appData[indexPath.section]["date"]
                cell.title2.text = appData[indexPath.section]["subTitle"]
                
                //cell.timeColumn.layer.cornerRadius = 4
                cell.timeColumn.layer.borderWidth = 1
                cell.timeColumn.layer.borderColor = UIColor.systemBlue.cgColor
                
                //cell.infoColumn.layer.cornerRadius = 4
                cell.infoColumn.layer.borderWidth = 1
                cell.infoColumn.layer.borderColor = UIColor.systemBlue.cgColor

                return cell
            default:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimeInfoTableViewCell.identifier) as! TimeInfoTableViewCell
                
                cell.timeColumn.text = schedule[indexPath.row-1]
                cell.infoColumn.text = activity[indexPath.row-1]
                
                //cell.timeColumn.layer.cornerRadius = 4
                cell.timeColumn.layer.borderWidth = 1
                cell.timeColumn.layer.borderColor = UIColor.systemBlue.cgColor
                
                //cell.infoColumn.layer.cornerRadius = 4
                cell.infoColumn.layer.borderWidth = 1
                cell.infoColumn.layer.borderColor = UIColor.systemBlue.cgColor
                
                
                return cell
            }
            
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250.0
        default:
            return 100
        }
    }
    
    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I was tapped")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width-50, height: 50))
        
        headerView.backgroundColor = .orange
        
        return headerView
    }
    

}
