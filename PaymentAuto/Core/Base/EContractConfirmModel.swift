//
//  EContractConfirmModel.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import SwiftyJSON
struct EContractConfirmModel {
    /*
     {
     "statusCode": 0,
     "message": "Thành công",
     "data": {
     "eContractConfirmed": 0,
     "eContractNotConfirmedMessage": {
     "heading": "Ký kết hợp đồng điện tử!",
     "body": "Quý khách có hợp đồng điện tử chưa xác nhận ký kết. Quý khách vui lòng đồng ý xác nhận để thực hiện việc ký kết hợp đồng."
     },
     "eContractCode": "HNK3058589",
     "eContractId": 19887663
     }
     }
     */
    var eContractConfirmed: Bool!
    var eContractNotConfirmedMessage: NotPhoneOwnedNotification!
    var eContractCode: String!
    var eContractId: String!
    
    init() {
        self.eContractConfirmed = false
        self.eContractNotConfirmedMessage = NotPhoneOwnedNotification.init()
        self.eContractCode = ""
        self.eContractId = ""
    }
    
    init(js: JSON) {
        if let contractIdTemp = js["eContractConfirmed"].int {
            if contractIdTemp == 1 {
                self.eContractConfirmed = true
            } else {
                self.eContractConfirmed = false
            }
        } else {
            self.eContractConfirmed = false
        }
        
        if let eContractNotConfirmedMessageTemp = js["eContractNotConfirmedMessage"].dictionaryObject {
            self.eContractNotConfirmedMessage = NotPhoneOwnedNotification.init(js: JSON.init(eContractNotConfirmedMessageTemp))
        } else {
            self.eContractNotConfirmedMessage = NotPhoneOwnedNotification.init()
        }
        
        if let eContractCodeTemp = js["eContractCode"].string {
            self.eContractCode = eContractCodeTemp
        } else {
            self.eContractCode = ""
        }
        
        if let eContractIdTemp = js["eContractId"].int {
            self.eContractId = "\(eContractIdTemp)"
        } else {
            self.eContractId = ""
        }
    }
}

