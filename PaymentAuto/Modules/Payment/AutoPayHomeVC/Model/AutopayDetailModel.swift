//
//  AutopayDetailModel.swift
//  Hi FPT
//
//  Created by Huy Le on 7/31/19.
//  Copyright © 2019 TaiVC. All rights reserved.
//

import Foundation
import SwiftyJSON

/*
 {
 "statusCode": 0,
 "message": "Thành công",
 "data": {
 "auto": 1265,
 "contractNo": "SGH073884",
 "tokenizationId": 1,
 "cardBrand": "VPB",
 "tokenStatus": "SUCCESS",
 "cardNumber": "970432xxxxxx4915",
 "bankImage": "https://hi-static.fpt.vn/upload/images/banks/NAPAS/VPB.png"
 }
 }
 */

public struct AutopayDetailModel {
    public var autopayId: String!
    var contractNo: String!
    var tokenizationId: String!
    var cardBrand: String!
    var tokenStatus: String!
    var cardNumber: String!
    var bankImage: String!
    
    init() {
        self.autopayId = ""
        self.contractNo = "SGH073884"
        self.tokenizationId = ""
        self.cardBrand = "VPB"
        self.tokenStatus = ""
        self.cardNumber = "970432xxxxxx4915"
        self.bankImage = "https://hi-static.fpt.vn/upload/images/banks/NAPAS/VPB.png"
    }
    
    /*
    
    init() {
        self.autopayId = ""
        self.contractNo = ""
        self.tokenizationId = ""
        self.cardBrand = ""
        self.tokenStatus = ""
        self.cardNumber = ""
        self.bankImage = ""
    }
    
    init(js: JSON) {
        if let autopayIdTemp = js["autopayId"].int {
            self.autopayId = "\(autopayIdTemp)"
        } else {
            self.autopayId = ""
        }
        
        if let contractNoTemp = js["contractNo"].string {
            self.contractNo = contractNoTemp
        } else {
            self.contractNo = ""
        }
        
        if let tokenizationIdTemp = js["tokenizationId"].int {
            self.tokenizationId = "\(tokenizationIdTemp)"
        } else {
            self.tokenizationId = ""
        }
        
        if let cardBrandTemp = js["cardBrand"].string {
            self.cardBrand = cardBrandTemp
        } else {
            self.cardBrand = ""
        }
        
        if let tokenStatusTemp = js["tokenStatus"].string {
            self.tokenStatus = tokenStatusTemp
        } else {
            self.tokenStatus = ""
        }
        
        if let cardNumberTemp = js["cardNumber"].string {
            self.cardNumber = cardNumberTemp
        } else {
            self.cardNumber = ""
        }
        
        if let bankImageTemp = js["bankImage"].string {
            self.bankImage = bankImageTemp
        } else {
            self.bankImage = ""
        }
    }
     
     */
}

