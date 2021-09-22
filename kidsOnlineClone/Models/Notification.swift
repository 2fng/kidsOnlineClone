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
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case notification_id = "notification_id"
        case type = "type"
        case notification_type = "notification_type"
        case title = "title"
        case title_en = "title_en"
        case sub_title = "sub_title"
        case sub_title_en = "sub_title_en"
        case date = "date"
        case is_read = "is_read"
        case is_delete = "is_delete"
        case action = "action"
        case created_at = "created_at"
        case url = "url"
        case item_id = "item_id"
        case item_type = "item_type"
        case avatar = "avatar"
        case icon = "icon"
        case corner_id = "corner_id"
        case comment_type = "comment_type"
        case type_comment = "type_comment"
        case student_id = "student_id"
        case school_id = "school_id"
        case post_id = "post_id"
        case student_gender = "student_gender"
        case survey_id = "survey_id"
        case class_id = "class_id"
        case message = "message"
        case popup_content = "popup_content"
        case student_name = "student_name"
        
    }
    
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        notification_id = try values.decodeIfPresent(String.self, forKey: .notification_id) ?? ""
        type = try values.decodeIfPresent(Int.self, forKey: .type) ?? 0
        notification_type = try values.decodeIfPresent(Int.self, forKey: .notification_type) ?? 0
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        title_en = try values.decodeIfPresent(String.self, forKey: .title_en) ?? ""
        sub_title = try values.decodeIfPresent(String.self, forKey: .sub_title) ?? ""
        sub_title_en = try values.decodeIfPresent(String.self, forKey: .sub_title_en) ?? ""
        date = try values.decodeIfPresent(Double.self, forKey: .date) ?? 0.0
        is_read = try values.decodeIfPresent(Int.self, forKey: .is_read) ?? 0
        is_delete = try values.decodeIfPresent(Int.self, forKey: .is_delete) ?? 0
        action = try values.decodeIfPresent(Int.self, forKey: .action) ?? 0
        created_at = try values.decodeIfPresent(Double.self, forKey: .created_at) ?? 0.0
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        item_id = try values.decodeIfPresent(Int.self, forKey: .item_id) ?? 0
        item_type = try values.decodeIfPresent(Int.self, forKey: .item_type) ?? 0
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
        icon = try values.decodeIfPresent(String.self, forKey: .icon) ?? ""
        corner_id = try values.decodeIfPresent(Int.self, forKey: .corner_id) ?? 0
        comment_type = try values.decodeIfPresent(Int.self, forKey: .comment_type) ?? 0
        type_comennt = try values.decodeIfPresent(Int.self, forKey: .type_comment) ?? 0
        student_id = try values.decodeIfPresent(Int.self, forKey: .student_id) ?? 0
        school_id = try values.decodeIfPresent(Int.self, forKey: .school_id) ?? 0
        post_id = try values.decodeIfPresent(Int.self, forKey: .post_id) ?? 0
        student_gender = try values.decodeIfPresent(Int.self, forKey: .student_gender) ?? 0
        survey_id = try values.decodeIfPresent(Int.self, forKey: .survey_id) ?? 0
        class_id = try values.decodeIfPresent(Int.self, forKey: .class_id) ?? 0
        message = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
        popup_content = try values.decodeIfPresent(String.self, forKey: .popup_content) ?? ""
        student_name = try values.decodeIfPresent(String.self, forKey: .student_name) ?? ""
        
        }
    
}
