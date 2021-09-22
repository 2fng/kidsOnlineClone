//
//  HomeTableViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 08/09/2021.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // MARK: - Data sample
    
    //data includes: date, title, subTitle, subTitleDetail, image, isLiked, likes, type
    //isLiked is the like button status
    //likes counts how many likes the post have
    //type is the cell type ( 1: schedule, 2: post )
    var appData = [["date": "08/09/2021", "title": "Hoat dong hoc cua be Cat Tien", "subTitle": "Ke hoach thang 9", "subTitleDetail": "Tuan 1 thang 9 nam 2021", "image": "", "isLiked": "", "likes": "0", "type": "1"],
                   ["date": "09/09/2021", "title": "Cam nang phong benh mua he cho tre", "subTitle": "", "subTitleDetail": "", "image": "image2", "isLiked": "false", "likes": "3", "type": "2"],
                   ["date": "09/08/2021", "title": "Hoat dong hoc cua be Cat Tien", "subTitle": "Ke hoach thang 8", "subTitleDetail": "Tuan 4 thang 8 nam 2021", "image": "image2", "isLiked": "false", "likes": "3", "type": "1"],
                   ["date": "10/09/2021", "title": "Cam nang phong benh mua he cho tre", "subTitle": "", "subTitleDetail": "", "image": "image3", "isLiked": "true", "likes": "5", "type": "2"],
                   ["date": "11/09/2021", "title": "Cam nang phong benh mua he cho tre", "subTitle": "", "subTitleDetail": "", "image": "image1", "isLiked": "false", "likes": "5", "type": "2"]
                   
    ]
    
    //Daily schedule
    var schedule = ["7:00 AM", "8:30 AM", "9:00 AM", "9:45 AM", "10:15 AM", "11:00 AM", "12:00 AM"]
    //Daily activity
    var activity = ["Don tre, tap the duc", "An sang", "HD ngoai troi", "Hoc nhac", "Hoc toan", "An trua", "Ngu trua"]
    
    //Create navBar Button
    let chatNavButton = UIBarButtonItem(image: UIImage(systemName: "quote.bubble.fill"), style: .plain, target: self, action: nil)
    let callNavButton = UIBarButtonItem(image: UIImage(systemName: "phone"), style: .plain, target: self, action: nil)
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
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
        tableView.register(BaiVietTableViewCell.nib(), forCellReuseIdentifier: BaiVietTableViewCell.identifier)
        
        //Register section header
        tableView.register(HomeCustomSectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
    }
    
    // MARK: - Set up view header
    func setupTalbeViewHeader() {
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        
        //Set frame size before populate view to have initial size
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        //Recalculate header size after populated the content
//        size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        size.width = UIScreen.main.bounds.width
//        header.frame.size = size
        
        tableView.tableHeaderView = header
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return appData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //If table type = schedule then return schedule.count+1 rows per section
        if appData[section]["type"] == "1"{
            return schedule.count+2
        }
        
        //If table type = bang tin then return 1 row per section
        else if appData[section]["type"] == "2" {
            return 1
        }
        return 0
    }
    
    // MARK: - Set up cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: - Type 1
        if appData[indexPath.section]["type"] == "1" {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as! ScheduleTableViewCell
                
                //Set up cell
                cell.date.text = appData[indexPath.section]["date"]
                cell.title.text = appData[indexPath.section]["title"]
                cell.date2.text = appData[indexPath.section]["date"]
                cell.title2.text = appData[indexPath.section]["subTitle"]

                return cell
            default:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimeInfoTableViewCell.identifier, for: indexPath) as! TimeInfoTableViewCell
                
                if indexPath.row == 1 {
                    
                    cell.timeColumn.text = "Thời gian"
                    cell.infoColumn.text = "Nội dung"
                    
                } else {
                    
                    cell.timeColumn.text = schedule[indexPath.row-2]
                    cell.infoColumn.text = activity[indexPath.row-2]
                    
                }
                
                cell.clipsToBounds = true
                
                //cell.timeColumn.layer.cornerRadius = 5
                cell.timeColumn.layer.borderWidth = 1
                cell.timeColumn.layer.borderColor = UIColor.systemBlue.cgColor
                
                //cell.infoColumn.layer.cornerRadius = 5
                cell.infoColumn.layer.borderWidth = 1
                cell.infoColumn.layer.borderColor = UIColor.systemBlue.cgColor
                
                
                return cell
            }
        }
        
        // MARK: - Type 2
        if appData[indexPath.section]["type"] == "2" {
            
            //Image and Tint color for the like button
            let heartImage = appData[indexPath.section]["isLiked"] == "true" ? "heart.fill" : "heart"
            let buttonColor = appData[indexPath.section]["isLiked"] == "true" ? UIColor.red : UIColor.black
            
            let cell = tableView.dequeueReusableCell(withIdentifier: BaiVietTableViewCell.identifier, for: indexPath) as! BaiVietTableViewCell
            
            //Set up cell
            cell.title.text = appData[indexPath.section]["title"]
            cell.date.text = appData[indexPath.section]["date"]
            cell.thumbNailImage.image = UIImage(named: appData[indexPath.section]["image"] ?? "image1")
            cell.likeButton.setImage(UIImage(systemName: heartImage), for: .normal)
            cell.likeButton.tintColor = buttonColor
            cell.likeCounter.text = appData[indexPath.section]["likes"]
            
            //Button tag for likeButtonTapped function
            cell.likeButton.tag = indexPath.section
            
            //Call the function when the button is tapped
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchUpInside)

            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - Like button is tapped function
    @objc func likeButtonTapped(sender: UIButton) {
        sender.isSelected = true
        
        if appData[sender.tag]["isLiked"] == "false" {
            appData[sender.tag]["isLiked"] = "true"
            
            //Convert from string to Int -> plus 1 -> convert from Int to String
            var tempCount = Int(appData[sender.tag]["likes"] ?? "0")!
            tempCount += 1
            appData[sender.tag]["likes"] = String(tempCount)
            
            //Set image to full heart with red color
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.tintColor = UIColor.red
        } else {
            appData[sender.tag]["isLiked"] = "false"
            
            //Convert from string to Int -> minus 1 -> convert from Int to String
            var tempCount = Int(appData[sender.tag]["likes"] ?? "0")!
            tempCount -= 1
            appData[sender.tag]["likes"] = String(tempCount)
            
            //Set image to empty heart with black color
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            sender.tintColor = UIColor.black
        }
        
        tableView.reloadData()
        
    }
    
    // MARK: - Row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250.0
        default:
            return 100.0
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
    
    
    // MARK: - Table view header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Create headerView and headerLabel
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! HomeCustomSectionHeader
        
        
        view.title.text = appData[section]["date"]
        
        return view
    }
    
}



