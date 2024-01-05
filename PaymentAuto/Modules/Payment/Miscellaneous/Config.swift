//
//  Config.swift
//  HiFPTPaymentSDK
//
//  Created by GiaNH3 on 8/2/21.
//

import Foundation
class Configs {
    // =========================PAYMENT================================== =AF=

    enum BILLING_SUB_BILLING_HISTORY_BY_CONTRACTID{
        static let endPoint = "/payment/contract/billings-history-by-contract-id"
        static let errorCode = "001"
    }
    enum BILLING_SUB_BILLING_LIST_BY_CONTRACTID{
        static let endPoint = "/payment/contract/list-bill-by-contract-id"
        static let errorCode = "002"
    }
    enum BILLING_SUB_CREATE_ORDER{
        static let endPoint = "/payment/create-order"
        static let errorCode = "003"
    }
    enum BILLING_HISTORY_PAYMENT_BEHALF{
        static let endPoint = "/payment/contract/history-payment-behalf"
        static let errorCode = "004"
    }
    enum BILLING_CHECK_BY_CONTRACT_NO{
        static let endPoint = "/payment/contract/billings-check-by-contract-no"
        static let errorCode = "005"
    }
    
    // 006 in ConstantsEndPoint
    
    enum LIST_BILL_BY_TYPE{
        static let endPoint = "/payment/contract/list-payment-by-type"
        static let errorCode = "007"
    }
    
    enum CHECK_PREPAID{
        static let endPoint = "/payment/contract/check-prepaid"
        static let errorCode = "008"
    }
    
    enum REGISTER_RECEIPT_PREPAID{
        static let endPoint = "/payment/contract/create-receipt-prepaid"
        static let errorCode = "009"
    }
    
    enum REMOVE_RECEIPT_PREPAID{
        static let endPoint = "/payment/contract/remove-receipt-prepaid"
        static let errorCode = "010"
    }
    
    enum VIEW_INTERNET_BILL{
        static let endPoint = "/payment/contract/view-internet-bill"
        static let errorCode = "011"
    }
    
    enum DOWNLOAD_INTERNET_BILL{
        static let endPoint = "/payment/contract/download-internet-bill"
        static let errorCode = "012"
    }
    
    //Thay thế cổng NAPAS thành FOXPAY
    enum FOXPAY_INFO{
        static let endPoint = "/payment-merchant/foxpay/foxpay-info"
        static let errorCode = "013"
    }
    
    enum FOXPAY_CHECK_LINK_TOKEN{///Đã chuyển qua KONG ở version 7.0.1
        static let endPoint = "/payment-merchant/foxpay/check-link-token"
        static let errorCode = "014"
    }
    
    enum BILLING_SUB_LIST_TOKENIZATION_BY_FOXPAY{
        static let endPoint = "/payment-merchant/customer/list-tokenization"
        static let errorCode = "015"
    }
    
    enum BILLING_SUB_CHECK_BILL_BY_CONTRACTID{
        static let endPoint = "/payment/contract/check-bill-by-contract-id"
        static let errorCode = "016"
    }
    
    enum CREATE_AUTOPAY{
        static let endPoint = "/payment-merchant/autopay/create-autopay"
        static let errorCode = "017"
    }
    
    enum BILLING_SUB_DELETE_TOKENIZATION{
        static let endPoint = "/payment-merchant/customer/delete-tokenization"
        static let errorCode = "018"
    }
    enum AUTOPAY_DETAIL{
        static let endPoint = "/payment-merchant/autopay/detail-autopay-by-contract"
        static let errorCode = "019"
    }
    
    enum EDIT_AUTOPAY{
        static let endPoint = "/payment-merchant/autopay/edit-autopay"
        static let errorCode = "020"
    }
    
    enum BILLING_SUB_CREATE_TOKENIZATION{
        static let endPoint = "/payment-merchant/create-tokenization"
        static let errorCode = "021"
    }
    
    enum PAYMENT_METHOD{
        static let endPoint = "/payment-merchant/autopay/payment-method"
        static let errorCode = "022"
    }
    
    enum DELETE_AUTOPAY{
        static let endPoint = "/payment-merchant/autopay/delete-autopay"
        static let errorCode = "023"
    }
    
    // 024 - 032 in ConstantsEndPoint
    
    enum BILLING_SUB_LIST_TOKENIZATION_METHOD{
        static let endPoint = "/payment-merchant/customer/list-tokenization-method"
        static let errorCode = "033"
    }
    
    enum PAYMENT_FOXPAY_TERMINAL_INFO{
        static let endPoint = "/payment-merchant/foxpay/terminal-info"
        static let errorCode = "034"
    }
    
    // 035 - 038 in ConstantsEndPoint
    
    // ==============================================================

    
    enum SALE_PLATFORM_CREATE_ORDER {
        static let endPoint = "/hi-ftel-ecom-api/ftel-services/create-payment-order"
        static let errorCode = "F??"
    }
    


    enum ECOM_CREATE_ORDER{
        static let endPoint = "/ecom-shopping/billing/create-payment-order"
        static let errorCode = "F25"
    }
}

