//
//  DiningDetail.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import Foundation

struct DiningDetail {
    
    let name: String //Tên bữa (Sáng, sáng phụ, trưa,...)
    let content: String //Nội dung thực đơn
    let comment: String //Ghi chú của giáo viên ( áp dụng khi comment_type ở Dining == 1)
    
    init(data: [String: Any]) {
        
        self.name = (data["name"] as? String) ?? ""
        self.content = (data["content"] as? String) ?? ""
        self.comment = (data["comment"] as? String) ?? ""
    }
}
