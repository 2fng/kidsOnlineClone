//
//  ResponseHoatDongHangNgay.swift
//  kidsOnlineClone
//
//  Created by Hua Son Tung on 01/10/2021.
//

import Foundation

class ResponseHoatDongHangNgay {
    
    //let hoatDongHangNgayArray: [HoatDongTheoNgay]
    //let diningArray: [Dining]
    let diningDetailArray: [DiningDetail]
    
    init(data: [String: Any]) {
        
        if let diningData = data["details"] as? [[String: Any]] {
            self.diningDetailArray = diningData.map({ DiningDetail(data: $0) })
            
            print("diningData thanh cong o day", diningData)
            print("diningDetailArray thanh cong o day", diningDetailArray)
        } else {
            
            self.diningDetailArray = []
            print("diningDetailArray fail o day", diningDetailArray)
        }
    }
}
