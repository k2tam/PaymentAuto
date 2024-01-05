//
//  HiFPTStatusResult.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
public struct HiFPTStatusResult: Error {
    public var message:String
    public var statusCode:Int
    
    public init (message:String, statusCode:Int) {
        self.message = message
        self.statusCode = statusCode
    }
    
    var description: String {
        return "message: \(message), statusCode: \(statusCode)"
    }
    
    static let accessTokenExpired = HiFPTStatusResult(message: "", statusCode: HiFPTStatusCode.AUTHEN_EXPIRE_TOKEN.rawValue)
}

enum HiFAuthenApiError: Error {
    case accessTokenExpired
    case refreshTokenExpired(message: String)
    case forceUpdate(message: String)
    case needOTP(authCode: String)
}

public enum HiFPTStatusCode: Int {
    init(_ type: Int) {
        if let type = HiFPTStatusCode(rawValue: type) {
            self = type
        } else {
            self = .UNDEFINED
        }
    }
    
    case UNDEFINED = -9999
    case CLIENT_ERROR = -1
    case SUCCESS = 0
    case AUTHEN_EXPIRE_TOKEN = 10403
    case AUTHEN_EXPIRE_REFRESH_TOKEN = 38015
    case FORCE_UPDATE = 50000
    case AUTHEN_NEED_OTP = 10005
    
    
    /// Login error need to pop view controller
    case AUTH_ENTER_PASS_FAIL = 38043
    case OTP_WRONG = 38009
    case PASS_WRONG = 38010
    case OTP_WRONG_LOCKED = 38014
    case PASS_LOCKED = 38028
    case OLD_PASS_WRONG = 38029
    case AUTH_CODE_EXPIRE_NEED_GO_TO_LOGIN = 38031
    
    case BIOMETRIC_EXPIRE = 38021 //Token sinh trắc học hết hạn hoặc tài khoản cũ chưa khởi tạo mật khẩu.
}

