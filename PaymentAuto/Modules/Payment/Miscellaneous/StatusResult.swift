//
//  HiPaymentStatusResult.swift
//  HiFPTPaymentSDK
//
//  Created by GiaNH3 on 8/2/21.
//

import Foundation
public struct HiPaymentStatusResult {
    public var message:String
    public var statusCode:Int
    
    public init (message:String, statusCode:Int) {
        self.message = message
        self.statusCode = statusCode
    }
}

public enum HiPaymentStatusCode: Int {
    init(_ type: Int) {
        if let type = HiPaymentStatusCode(rawValue: type) {
            self = type
        } else {
            self = .UNDEFINED
        }
    }
    
    case UNDEFINED = -9999
    case SUCCESS = 0
    case DATA_NULL = 6
    case CLIENT_ERROR = -1
    case ERROR_SESSION = 3
    case OTP_MAX_SMS = 7
    case EXPIRED_SESSION = 10
    case EXECUTING_GIFT = 16
    case OUT_STOCK_GIFT = 18
    case OUT_OF_POINT = 19
    //case EXPIRED_DATE_GIFT = 20 - LOYALTY DELETE
    case PAID_BILL = 31 //Anh Trí confirm hk đổi nữa.
    case PAY_SEARCH_LOCK = 15
    // Do Status code 20, 21 các anh API không nhớ nó là gì;
    // trong code đang xử lý giống trường hợp văng về login
    // Nên sẽ xử lý tương tự trên Hi-Authen
    case ACCESSTOKEN_EXPIRE = 20 //Renew accessToken With Token Biometric - expire
    case ACCESSTOKEN_DELETE = 21 //Renew accessToken With Token Biometric - delete
    case CAMERA_DATA_NULL = 686
    case FSECURE_TOAST_SUCCESS = 11000
    case FSECURE_TOAST_FAILED = 11001
    case FSECURE_PROFILE_TXTFIELD_WRONG = 11002
    case FSECURE_REPLACE_POPUP = 11003
    case LC_SHOW_MESSAGE_LABEL = 12005
    //AUTHEN V5.11
    case AUTHEN_EXPIRE_TOKEN = 10403
    case AUTHEN_WRONG_SIGNATURE = 10404
    case AUTHEN_ACTIVE_PHONE = 10001
    case AUTHEN_EXPIRE_REFRESH_TOKEN = 38015
    
    //V5.13.1
    case SURVER_SAVE_NOT_SUCCESS = 1
    
    //v6.0
    case HDI_HAS_CHANGE_FEE = 98012
    case PAYMENT_DATA_NULL = 70006
    
    //v6.4
    case PAYMENT_EXPIRED_SESSION = 23100
    
}
