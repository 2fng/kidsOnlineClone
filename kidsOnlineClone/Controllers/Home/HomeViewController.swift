//
//  HomeViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 06/09/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var homeTableView: UITableView!
    
    var scheduleDates = ["Chu nhat, 05/09/2021", "Thu bay, 04/09/2021", "Thu sau, 03/09/2021", "Thu nam, 02/09/2021", "Thu tu, 01/09/2021", "Thu ba, 31/08/2021", "Thu hai, 30/08/2021"]
    
    var students = [ Student(name: "Cat Tien", scheduleDate: ["Chu nhat, 05/09/2021", "Thu bay, 05/09/2021", "Chu nhat, 04/09/2021", "Thu sau, 03/09/2021", "Thu nam, 02/09/2021", "Thu tu, 01/09/2021", "Thu ba, 31/08/2021", "Thu hai, 30/08/2021"])]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.hidesBarsOnSwipe = true
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! HomeTableViewCell
        
        cell.scheduleDateLabel?.text = scheduleDates[indexPath.row]
        cell.dateLabelView.layer.cornerRadius = 5
        
        cell.scheduleView.layer.cornerRadius = 5
        cell.scheduleLabel?.text = "Hoat dong hoc cua be"
        cell.scheduleLabelDate?.text = scheduleDates[indexPath.row]
        cell.scheduleWeek?.text = scheduleDates[indexPath.row]
        cell.scheduleWeekDetail?.text = scheduleDates[indexPath.row]
        
        return cell
    }
    
    
}
