//
//  HomeTableViewCell.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 06/09/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var schedule = ["7:00 AM", "8:30 AM", "9:00 AM", "9:45 AM", "10:15 AM", "11:00 AM", "11:45 AM"]
    
    @IBOutlet var timeInfoTable: UITableView!
    //DateLabel View
    @IBOutlet var dateLabelView: UIView!
    @IBOutlet var scheduleDateLabel: UILabel!
    
    //Schedule View
    @IBOutlet var scheduleView: UIView!
    @IBOutlet var scheduleLabel: UILabel!
    @IBOutlet var scheduleLabelDate: UILabel!
    @IBOutlet var scheduleWeek: UILabel!
    @IBOutlet var scheduleWeekDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        timeInfoTable.dataSource = self
        timeInfoTable.delegate = self
        timeInfoTable.isScrollEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeInfoCell", for: indexPath) as! TimeInfoTableViewCell
        
        cell.timeColumn?.text = schedule[indexPath.row]
        cell.timeColumn.lineBreakMode = .byWordWrapping
        cell.timeColumn.numberOfLines = 0
        cell.infoColumn?.text = ""
        cell.timeColumn.layer.borderWidth = 1
        cell.timeColumn.layer.borderColor  = UIColor.black.cgColor
        return cell
    }
    
}

extension HomeTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
    
}
