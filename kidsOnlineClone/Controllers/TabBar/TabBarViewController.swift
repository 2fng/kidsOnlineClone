//
//  TabBarViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 08/09/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Create variable to store view controllers
        let homeVC = HomeTableViewController()
        let taiKhoanVC = TaiKhoanTableViewController()
        let tinhNangVC = TinhNangTableViewController()
        let thongBaoVC = ThongBaoTableViewController()
        
        
        // Setup Title
        homeVC.title = "Bảng tin"
        taiKhoanVC.title = "Tài khoản"
        tinhNangVC.title = "Tính năng"
        thongBaoVC.title = "Thông báo"
        
        // Setup tabBar Image and Title
        homeVC.tabBarItem = UITabBarItem(title: "Bảng tin", image: UIImage(systemName: "house"), tag: 1)
        taiKhoanVC.tabBarItem = UITabBarItem(title: "Tài khoản", image: UIImage(systemName: "person.circle"), tag: 1)
        tinhNangVC.tabBarItem = UITabBarItem(title: "Tính năng", image: UIImage(systemName: "gearshape.2.fill"), tag: 1)
        thongBaoVC.tabBarItem = UITabBarItem(title: "Thông báo", image: UIImage(systemName: "bell"), tag: 1)
        
        // Create variable for tab bar and set up tab bar
        let homeNav = UINavigationController(rootViewController: homeVC)
        let taiKhoanNav = UINavigationController(rootViewController: taiKhoanVC)
        let tinhNangNav = UINavigationController(rootViewController: tinhNangVC)
        let thongBaoNav = UINavigationController(rootViewController: thongBaoVC)
        
        setViewControllers([homeNav, tinhNangNav, thongBaoNav, taiKhoanNav], animated: false)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
