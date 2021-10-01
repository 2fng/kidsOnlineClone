//
//  HoatDongTheoNgay.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import Foundation

struct HoatDongTheoNgay {
    
    let dining: Dining //Hoat dong an
    
    init(data: [String: Any]) {
        self.dining = (data["dining"] as? Dining) ?? Dining(data: [:])
    }
}
