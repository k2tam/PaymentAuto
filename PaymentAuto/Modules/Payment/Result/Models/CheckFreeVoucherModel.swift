//
//  CheckFreeVoucherModel.swift
//  Hi FPT
//
//  Created by Trinh Quang Hiep on 13/06/2022.
//

public enum PaymentResultStatus {
    case SUCCESS
    case SUCCESSAUTOPAY //- Không thấy sử dụng - QuocL note
    case FAILURE
    case SUCCESS_WITHOUT_PAYMENTMETHOD
}

import Foundation
import SwiftyJSON
struct CheckFreeVoucherModel {
    var amountText: String
    var amount: Int
    var content: ContentCheckFreeVoucherModel
    var isPayRequired: Bool?
    var evcTitle: String
    var evcAmountText: String
    var evcAmount: Int
    var orderId: String
    
    init(json : JSON){
        self.amountText = json["amountText"].stringValue
        self.amount = json["amount"].intValue
        self.content = ContentCheckFreeVoucherModel(json: json["content"])
        self.isPayRequired = json["isPayRequired"].bool
        self.evcTitle = json["evcTitle"].stringValue
        self.evcAmountText = json["evcAmountText"].stringValue
        self.evcAmount = json["evcAmount"].intValue
        self.orderId = json["orderId"].stringValue
    }
    
}

// MARK: - Content
struct ContentCheckFreeVoucherModel {
    let title, body: String
    init(json : JSON){
        self.title = json["title"].stringValue
        self.body = json["body"].stringValue
       
    }
}

