//
//  Notification.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 22/09/2021.
//

import Foundation
import UIKit

struct Notification {
    
    let id: String
    let notification_id: String
    let type: Int
    let notification_type: Int
    let title: String
    let title_en: String
    let sub_title: String
    let sub_title_en: String
    let date: Double
    var is_read: Bool
    var is_delete: Int
    let action: Int
    let created_at: Double
    let url: String?
    let item_id: Int
    let item_type: Int
    let avatar: String
    let icon: String
    let corner_id: Int
    let comment_type: Int
    let type_comennt: Int
    let student_id: Int
    let school_id: Int
    let post_id: Int
    let student_gender: Int
    let survey_id: Int
    let class_id: Int
    let message: String
    let popup_content: String
    let student_name: String
    
    init(data: [String: Any]) {
        
        self.id = (data["id"] as? String) ?? ""
        self.notification_id = (data["notification_id"] as? String) ?? ""
        self.type = (data["type"] as? Int) ?? 0
        self.notification_type = (data["notification_type"] as? Int) ?? 0
        self.title = (data["title"] as? String) ?? ""
        self.title_en = (data["title_en"] as? String) ?? ""
        self.sub_title = (data["sub_title"] as? String) ?? ""
        self.sub_title_en = (data["sub_title_en"] as? String) ?? ""
        self.date = (data["date"] as? Double) ?? 0.0
        self.is_read = ((data["is_read"] as? Int) ?? 0) == 1
        self.is_delete = (data["is_delete"] as? Int) ?? 0
        self.action = (data["action"] as? Int) ?? 0
        self.created_at = (data["created_at"]  as? Double) ?? 0.0
        self.url = (data["url"] as? String) ?? ""
        self.item_id = (data["item_id"] as? Int) ?? 0
        self.item_type = (data["item_type"] as? Int) ?? 0
        self.avatar = (data["avatar"] as? String) ?? ""
        self.icon = (data["icon"] as? String) ?? ""
        self.corner_id = (data["corner_id"] as? Int) ?? 0
        self.comment_type = (data["comment_type"] as? Int) ?? 0
        self.type_comennt = (data["type_comment"] as? Int) ?? 0
        self.student_id = (data["student_id"] as? Int) ?? 0
        self.school_id = (data["school_id"] as? Int) ?? 0
        self.post_id = (data["post_id"] as? Int) ?? 0
        self.student_gender = (data["student_gender"] as? Int) ?? 0
        self.survey_id = (data["survey_id"] as? Int) ?? 0
        self.class_id = (data["class_id"] as? Int) ?? 0
        self.message = (data["message"] as? String) ?? ""
        self.popup_content = (data["popup_content"] as? String) ?? ""
        self.student_name = (data["student_name"] as? String) ?? ""
        
        }
}
