//
//  ResponseNotification.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 24/09/2021.
//

import Foundation

class ResponseNotification {
    
    //let status: Int
    let arrayNotification: [Notification]
    
    init(data: [String: Any]) {
        if let notificationData = data["notifications"] as? [[String: Any]] {
            self.arrayNotification = notificationData.map { Notification(data: $0)}
        } else {
            self.arrayNotification = []
        }
    }
}
