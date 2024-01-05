//
//  PaymentOldEndPoint.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit
import Alamofire
enum OTPType: String{
    case UPGRADE_SERVICE_PACKAGE
    case CHANGE_PAYMENT_METHOD
    case CHECK_OWN_PARENTAL_CONTROL
    case NONE = ""
}
enum PaymentOldEndPoint {
    case billingHistoryByContractId
    case billingListByContractId
    static func paramsContractId(contractId: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kContractId: contractId
        ]
    }
    
    case createOrder
    static func paramsCreateOrder(contractNo: String, paymentMethod: PayMethodType, listBill:[String], listReceipt:[String], tokenizationId:Int?, isTokenization:Bool, paymentFromContract:String?, process: String? = nil) -> Parameters {
        
        var createTokenization = 0
        if(isTokenization){
            createTokenization = 1
        }
        
        var params:Parameters = [
            Constants.KeyNameAPI.kContractNo: contractNo,
            "paymentType": "BILLING_RECEIPT",
            "paymentMethod":paymentMethod.rawValue,
            "billingIdReceipt":listReceipt,
            "billingIdBill":listBill,
             "isTokenization" : createTokenization
            ]
        
        if(tokenizationId != nil){
            params["tokenizationId"] = tokenizationId
        }else{
            params["tokenizationId"] = "0"
        }
        
        if(paymentFromContract != nil){
            params["paymentFromContract"] = paymentFromContract
        }
        
        if(process != nil || process != ""){
            params["process"] = process
        }
        
        return params
    }
//    case listMyTokenization
    static func paramsListFoxpayInternationalTokenization() -> Parameters {
        return [
            "type" : "INTERNATIONAL",
            "cardProvider"  : "FOXPAY_GATEWAY"
        ]
    }
    
    case deleteTokenization
    static func paramsDeleteTokenization(tokenId:Int) -> Parameters {
        return [
            "tokenizationId" : tokenId
        ]
    }
    case historyPaymentBehalf
    
    case paymentBehalfBillingCheck
    static func paramsPaymentBehalfContractNo(contractNo: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kContractNo: contractNo
        ]
    }
    
    case PaymentMethod
    static func paramsPaymentMethod(contractId: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kContractId : contractId
        ]
    }
    case AutoPayDetail
    static func paramsAutoPayDetail(contractNo: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kContractNo : contractNo
        ]
    }
    case DeleteAutoPay
    static func paramsDeleteAutoPay(autopayId: String, methodKey: String, phone: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kAutopayId : autopayId,
            Constants.KeyNameAPI.kMethodKey : methodKey
        ]
    }
    
    case createTokenization
    static func paramsCreateTokenization() -> Parameters {
        return [
            "paymentMethod" : "INTERNATIONAL"
        ]
    }
    case createAutoPay
    static func paramsCreateAutoPay(contractNo: String, tokenizationId: String, referer: OTPType = .NONE) -> Parameters {
        switch referer {
        case .CHANGE_PAYMENT_METHOD:
            return [
                Constants.KeyNameAPI.kContractNo : contractNo,
                "tokenizationId" : tokenizationId,
                "referer": referer.rawValue
            ]
        default:
            return [
                Constants.KeyNameAPI.kContractNo : contractNo,
                "tokenizationId" : tokenizationId
            ]
        }
    }
    case editAutoPay
    static func paramsEditAutoPay(contractNo: String, tokenizationId: String, autopayId: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kContractNo : contractNo,
            "tokenizationId" : tokenizationId,
            Constants.KeyNameAPI.kAutopayId : autopayId,
        ]
    }
    case listBillEContract
    static func paramsListBillEContract(contractNo: String) -> Parameters {
        return [
            Constants.KeyNameAPI.kContractNo : contractNo,
            "paymentType" : "RECEIPT",
            "function" : "e-contract",
        ]
    }
    case viewInternetBill
    static func paramsViewInternetBill(billNumber: String) -> Parameters {
        return [
            "billNumber" : billNumber
        ]
    }
    case dowloadInternetBill
    static func paramsdowloadInternetBill(billNumber: String) -> Parameters {
        return [
            "billNumber" : billNumber
        ]
    }
    case GetMerchantFoxpay
    
    case checkLinkTokenFoxpay
    static func paramsCheckLinkTokenFoxpay(linkToken: String) -> Parameters {
        return [
            "linkToken" : linkToken
        ]
    }
    
    //MARK:v6.0
    case foxpayListMyTokenization
    static func paramsFoxpayListMyTokenization()  -> Parameters{
        return ["cardProvider":"FOXPAY_GATEWAY"]
    }
    case listTokenizationMethod
    static func paramsListTokenizationMethod(provider: String, paymentType: String, contractNo: String) -> Parameters {
        return [
            "paymentProvider": provider,
            "paymentType": paymentType,
            "contractNo": contractNo
        ]
    }
    
    case checkBillByContractId
    static func paramsCheckBillByContractId(contractId:String)  -> Parameters{
        return [Constants.KeyNameAPI.kContractId: contractId]
    }
    
    case eComCreateOrder
    static func paramsEComCreateOrder(transId: String, transType:String, paymentMethod: PayMethodType, totalAmount:Double, tokenizationId:Int?, isTokenization:Bool, promoCodes:[String], skus: [ItemSku], details: [ItemSkuDetails])  -> Parameters{
        /* PARAMS
            {
                "trans_id": "FPL0000055",
                "trans_type": "FPLAY",
                "payment_method": "DOMESTIC",
                "isTokenization": 0,
                "tokenizationId": 0,
                "total_amount": 50000,
                "promotion_code": "ABCD"
            }
         */
        return [
                    "trans_id": transId,
                    "trans_type": transType,
                    "payment_method": paymentMethod.rawValue,
                    "isTokenization": isTokenization ? 1 : 0,
                    "tokenizationId": tokenizationId != nil ? tokenizationId! : 0,
                    "total_amount": totalAmount,
                    "promo_code": promoCodes,
                    "skus": skus.map({ return [
                        "sku": $0.sku,
                        "amount": $0.amount
                    ]}),
                    "details": details.map({ return [
                        "id": $0.id,
                        "amount": $0.amount
                    ]})
                    
        ]
    }
    
    case foxpayTerminalInfo
    static func paramsFoxpayTerminalInfo(contractNo: String? = nil, serviceType:String)  -> Parameters{
        if let contract = contractNo{
            return [
                "contractNo": contract,
                "paymentType": serviceType
            ]
        }else{
            return [
                "paymentType": serviceType
            ]
        }
    }
}

extension PaymentOldEndPoint: HiFPTPaymentEndPoint{
    var errorCode: String {
        switch self {
        case .billingHistoryByContractId:
            return Configs.BILLING_SUB_BILLING_HISTORY_BY_CONTRACTID.errorCode
        case .billingListByContractId:
            return Configs.BILLING_SUB_BILLING_LIST_BY_CONTRACTID.errorCode
        case .createOrder:
            return Configs.BILLING_SUB_CREATE_ORDER.errorCode
//        case .listMyTokenization:
//             return Configs.BILLING_SUB_LIST_MY_TOKENIZATION.errorCode
        case .deleteTokenization:
            return Configs.BILLING_SUB_DELETE_TOKENIZATION.errorCode
        case .historyPaymentBehalf:
            return Configs.BILLING_HISTORY_PAYMENT_BEHALF.errorCode
        case .paymentBehalfBillingCheck:
            return Configs.BILLING_CHECK_BY_CONTRACT_NO.errorCode
        case .PaymentMethod:
            return Configs.PAYMENT_METHOD.errorCode
        case .AutoPayDetail:
            return Configs.AUTOPAY_DETAIL.errorCode
        case .DeleteAutoPay:
            return Configs.DELETE_AUTOPAY.errorCode

        case .createTokenization:
            return Configs.BILLING_SUB_CREATE_TOKENIZATION.errorCode
        case .createAutoPay:
            return Configs.CREATE_AUTOPAY.errorCode
        case .editAutoPay:
            return Configs.EDIT_AUTOPAY.errorCode
        case .listBillEContract:
            return Configs.LIST_BILL_BY_TYPE.errorCode
        case .viewInternetBill:
            return Configs.VIEW_INTERNET_BILL.errorCode
        case .dowloadInternetBill:
            return Configs.DOWNLOAD_INTERNET_BILL.errorCode
        case .GetMerchantFoxpay:
            return Configs.FOXPAY_INFO.errorCode
        case .checkLinkTokenFoxpay:
            return Configs.FOXPAY_CHECK_LINK_TOKEN.errorCode
        case .listTokenizationMethod:
            return Configs.BILLING_SUB_LIST_TOKENIZATION_METHOD.errorCode
        default:
            return ""
        }
    }
    
    public var url: String {
        switch self {
        case .billingHistoryByContractId:
            return Configs.BILLING_SUB_BILLING_HISTORY_BY_CONTRACTID.endPoint
        case .billingListByContractId:
            return Configs.BILLING_SUB_BILLING_LIST_BY_CONTRACTID.endPoint
        case .createOrder:
            return Configs.BILLING_SUB_CREATE_ORDER.endPoint
//        case .listMyTokenization:
//             return Configs.BILLING_SUB_LIST_TOKENIZATION_BY_FOXPAY
        case .deleteTokenization:
            return Configs.BILLING_SUB_DELETE_TOKENIZATION.endPoint
        case .historyPaymentBehalf:
            return Configs.BILLING_HISTORY_PAYMENT_BEHALF.endPoint
        case .paymentBehalfBillingCheck:
            return Configs.BILLING_CHECK_BY_CONTRACT_NO.endPoint
        case .PaymentMethod:
            return Configs.PAYMENT_METHOD.endPoint
        case .AutoPayDetail:
            return Configs.AUTOPAY_DETAIL.endPoint
        case .DeleteAutoPay:
            return Configs.DELETE_AUTOPAY.endPoint
   
        case .createTokenization:
            return Configs.BILLING_SUB_CREATE_TOKENIZATION.endPoint
        case .createAutoPay:
            return Configs.CREATE_AUTOPAY.endPoint
        case .editAutoPay:
            return Configs.EDIT_AUTOPAY.endPoint
        case .listBillEContract:
            return Configs.LIST_BILL_BY_TYPE.endPoint
        case .viewInternetBill:
            return Configs.VIEW_INTERNET_BILL.endPoint
        case .dowloadInternetBill:
            return Configs.DOWNLOAD_INTERNET_BILL.endPoint
        case .GetMerchantFoxpay:
            return Configs.FOXPAY_INFO.endPoint
        case .checkLinkTokenFoxpay:
            return Configs.FOXPAY_CHECK_LINK_TOKEN.endPoint
        case .foxpayListMyTokenization:
            return Configs.BILLING_SUB_LIST_TOKENIZATION_BY_FOXPAY.endPoint
        case .checkBillByContractId:
            return Configs.BILLING_SUB_CHECK_BILL_BY_CONTRACTID.endPoint
        case .eComCreateOrder:
            return Configs.ECOM_CREATE_ORDER.endPoint
        case .foxpayTerminalInfo:
            return Configs.PAYMENT_FOXPAY_TERMINAL_INFO.endPoint
        case .listTokenizationMethod:
            return Configs.BILLING_SUB_LIST_TOKENIZATION_METHOD.endPoint
        }
    }
}

enum PaymentOldEndPointKong {
    case salePlatformCreateOrder
    static func paramsSalePlatformCreateOrder(orderId: Int) -> Parameters {
        return [
            "orderId": orderId
        ]
    }
}

extension PaymentOldEndPointKong: HiFPTPaymentEndPointRawUrl {
    var errorCode: String {
        switch self {
        case .salePlatformCreateOrder:
            return Configs.SALE_PLATFORM_CREATE_ORDER.errorCode
        }
    }
    public var url: String {
        let urlKongBase = MyGlobal.shared().infoForKey("SERVER_KONG_BASE_URL") ?? ""
        let serverApiVersion = MyGlobal.shared().infoForKey("ServerVersion") ?? "v70"
        var endPoint: String = ""
        
        switch self {
        case .salePlatformCreateOrder:
            endPoint = Configs.SALE_PLATFORM_CREATE_ORDER.endPoint
        }
        
        return urlKongBase + "/" + serverApiVersion + endPoint
    }
}

