//
//  ResponseIsReadNotification.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 24/09/2021.
//

import Foundation

class ResponseIsReadNotification {
    
    //let status: Int
    let arrayNotificationRead: [String]
    
    init(data: [String: Any]) {

        self.arrayNotificationRead = (data["notification_ids"] as? [String]) ?? []
        
    }
}
