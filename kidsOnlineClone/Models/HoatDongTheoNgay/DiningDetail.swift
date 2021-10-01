//
//  DiningDetail.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import Foundation

struct DiningDetail {
    
    let name: String
    let content: String
    let comment: String
    
    init(data: [String: Any]) {
        
        self.name = (data["name"] as? String) ?? ""
        self.content = (data["content"] as? String) ?? ""
        self.comment = (data["comment"] as? String) ?? ""
    }
}
