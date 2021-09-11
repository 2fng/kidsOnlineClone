//
//  HomeCustomSectionHeader.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 11/09/2021.
//

import UIKit

class HomeCustomSectionHeader: UITableViewHeaderFooterView {

    let title = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(title)
        
        //Center label vertically
        NSLayoutConstraint.activate([
            
            title.heightAnchor.constraint(equalToConstant: 50),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ])
        
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        contentView.backgroundColor = .orange
        contentView.bringSubviewToFront(title)
    }

}
