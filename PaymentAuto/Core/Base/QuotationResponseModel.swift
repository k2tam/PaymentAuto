//
//  QuotationResponseModel.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import Foundation
import SwiftyJSON

struct QuotationResponseModel {
    var url: String!
    var notif: NotPhoneOwnedNotification!
    var isConfirmed: Bool
    
    init() {
        self.url = ""
        self.notif = NotPhoneOwnedNotification.init()
        self.isConfirmed = false
    }
    
    init(js: JSON) {
        if let urlTemp = js["url"].string {
            self.url = urlTemp
        } else {
            self.url = ""
        }
        
        if let notPhoneOwnedNotificationTemp = js["notPhoneOwnedNotification"].dictionaryObject {
            self.notif = NotPhoneOwnedNotification.init(js: JSON.init(notPhoneOwnedNotificationTemp))
        } else {
            self.notif = NotPhoneOwnedNotification.init()
        }
        self.isConfirmed = js["isConfirmed"].boolValue
    }
}

struct NotPhoneOwnedNotification {
    var heading: String!
    var body: String!
    
    init() {
        self.heading = ""
        self.body = ""
    }
    
    init(js: JSON) {
        if let headingTemp = js["heading"].string {
            self.heading = headingTemp
        } else {
            self.heading = ""
        }
        
        if let bodyTemp = js["body"].string {
            self.body = bodyTemp
        } else {
            self.body = ""
        }
    }
}

struct EContractURL {
    var htmlViewUrl: String!
    var policyConfirmationText: String!
    var isConfirmed: Bool
    var id: String
    
    init() {
        self.htmlViewUrl = ""
        self.policyConfirmationText = ""
        self.isConfirmed = false
        self.id = ""
    }
    
    init(js: JSON) {
        if let htmlViewUrlTemp = js["url"].string {
            self.htmlViewUrl = htmlViewUrlTemp
        } else {
            self.htmlViewUrl = ""
        }
        
        if let policyConfirmationTextTemp = js["policyConfirmationText"].string {
            self.policyConfirmationText = policyConfirmationTextTemp
        } else {
            self.policyConfirmationText = ""
        }
        self.isConfirmed = js["isConfirmed"].boolValue
        self.id = js["id"].stringValue
    }
}
