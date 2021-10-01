//
//  Dining.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import Foundation

struct Dining {
    
    let menu_type: Int //Loại thực đơn (1: Thực đơn ăn cơ bản, 3: Thực đơn sử dụng tệp tin - chi tiết xem trên wiki.omt.vn)
    let url: String //Đường dẫn đến thực đơn (Áp dụng cho menu_type == 3)
    let comment_type: Int //Loại nhận xét (1: Theo bữa, 2: Theo ngày)
    let comment: String //Nhận xét ăn cả ngày (Áp dụng cho comment_type == 2)
    let details: DiningDetail //Thực đơn theo từng bữa
    let view_menu: Int //Có cho phép xem thực đơn theo tuần không? (0: Không, 1: Có) - Không áp dụng cho menu_type == 3
    
    
    init(data: [String: Any]) {
        
        self.menu_type = (data["menu_type"] as? Int) ?? 0
        self.url = (data["url"] as? String) ?? ""
        self.comment_type = (data["comment_type"] as? Int) ?? 1
        self.comment = (data["comment"] as? String) ?? ""
        self.details = (data["details"] as? DiningDetail) ?? DiningDetail(data: [:])
        self.view_menu = (data["view_menu"] as? Int) ?? 0
        
    }
}
