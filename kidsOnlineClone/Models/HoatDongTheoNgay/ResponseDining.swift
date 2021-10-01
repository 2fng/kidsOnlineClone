//
//  ResponseDining.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import Foundation

class ResponseDining {
    
    let diningDetailArray: [DiningDetail]
    
    init(data: [String: Any]) {
        
        if let diningDetailData = data["details"] as? [[String: Any]] {
            self.diningDetailArray = diningDetailData.map({ DiningDetail(data: $0)})
        } else {
            self.diningDetailArray = []
        }
    }
}
