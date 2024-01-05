//
//  ItemSku.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//


import Foundation
import SwiftyJSON
struct ItemSku {
    var amount: Int
    var sku: String
    
    init(json: JSON) {
        self.amount = json["amount"].intValue
        self.sku = json["sku"].stringValue
    }
    
    init(amt: Int, sku: String) {
        self.amount = amt
        self.sku = sku
    }
}

struct ItemSkuDetails {
    var amount: Int
    var id: String
    
    init(json: JSON) {
        self.amount = json["amount"].intValue
        self.id = json["id"].stringValue
    }
    
    init(amount: Int, id: String) {
        self.amount = amount
        self.id = id
    }
}
