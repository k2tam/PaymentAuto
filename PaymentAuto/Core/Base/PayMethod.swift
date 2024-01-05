//
//  PayMethod.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation

import SwiftyJSON

public struct PayMethod {
    var imgUrl: String?
    var title: String?
    var desc:String?
    var paymentSourceType: PayType
    var type: PayMethodType?
    var tokenizationId:Int?
    var provider: String
    init(js: JSON) {
        self.tokenizationId = js["id"].intValue
        self.title = js["title"].stringValue
        self.desc = js["description"].stringValue
        self.provider = js["provider"].stringValue
        self.imgUrl = js["url"].stringValue
        self.type = PayMethodType(rawValue: js["paymentMethod"].stringValue) ?? .NONE
        self.paymentSourceType = PayType(rawValue: js["type"].stringValue) ?? .WEBKIT
    }
    
    init(imgUrl: String?, title: String?, desc: String?, type: PayMethodType?, tokenizationId: Int?, sourceType: PayType = .TOKENIZATION) {
        self.tokenizationId = tokenizationId
        self.title = title
        self.desc = desc
        self.provider = "FOXPAY"
        self.imgUrl = imgUrl
        self.type = type
        self.paymentSourceType = sourceType
    }
    
    init() {
        self.tokenizationId = nil
        self.title = nil
        self.desc = nil
        self.provider = "FOXPAY"
        self.imgUrl = nil
        self.type = nil
        self.paymentSourceType = .WEBKIT
    }
}


enum PayMethodType: String {
    case FOXPAY = "WALLET_FOXPAY"
    case TOKENIZATION = "TOKENIZATION"
    case INTERNATIONAL = "INTERNATIONAL"
    case DOMESTIC = "DOMESTIC"
    case NONE = ""
    
}

enum PayType:String {
    case WALLET = "WALLET" // WALLET : ví điện tử (hiện tại chỉ FOXPAY)
    case TOKENIZATION = "TOKENIZATION" // thẻ đã được số hóa
    case WEBKIT = "WEBKIT" // bao gồm thanh toán thẻ nội địa và quốc tế
    
}
