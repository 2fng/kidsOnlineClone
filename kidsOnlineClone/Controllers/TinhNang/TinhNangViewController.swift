//
//  TinhNangViewController.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 07/09/2021.
//

import UIKit

class TinhNangViewController: UIViewController {
    
    @IBOutlet private weak var tinhNangTableView: UITableView!
    @IBOutlet weak var tinhNangPageControl: UIPageControl!
    
    var buttons = [["image": "folder", "label": "button"],
                   ["image": "folder.fill", "label": "button fill"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let layout = UICollectionViewFlowLayout()
    }
    
    private func configTableView() {
        tinhNangTableView.dataSource = self
        tinhNangTableView.delegate = self
        tinhNangTableView.register(TinhNangTableViewCell.nib(), forCellReuseIdentifier: TinhNangTableViewCell.identifier)
    }
}

extension TinhNangViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TinhNangTableViewCell.identifier, for: indexPath) as! TinhNangTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //let tableViewCell = cell as! TinhNangTableViewCell
        //tableViewCell.setupCollectionView(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    
}

extension TinhNangViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCollectionViewCell.identifier, for: indexPath) as! ButtonsCollectionViewCell
        
        
        return cell
        
    }
    
    
}
