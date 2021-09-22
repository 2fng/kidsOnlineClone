//
//  Notification.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 22/09/2021.
//

import Foundation

struct Notification: Codable {
    
    let id: String
    let notification_id: String
    let type: Int
    let notification_type: Int
    let title: String
    let title_en: String
    let sub_title: String
    let sub_title_en: String
    let date: Double
    let is_read: Int
    let is_delete: Int
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
    
    
    
}
