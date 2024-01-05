//
//  HiFPTPayment.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit
import Alamofire

import SwiftyJSON

public class HiFPTPayment {
    public static let shared:HiFPTPayment = HiFPTPayment()
    public var allowMethodFoxpay:Bool = true
    public var isCustomerOfFPT:Bool = true
//    var totalContract:Int {
//        get{
//            if let delegate = popupDelegate{
//                return delegate.getTotalContractFromMainApp()
//            }
//            return 0
//        }
//    }
//    var totalContractActive:Int{
//        get{
//            if let delegate = popupDelegate{
//                return delegate.getTotalContractActiveFromMainApp()
//            }
//            return 0
//        }
//    }
    public weak var baseNav: UINavigationController?
    public weak var popupDelegate: HiFPTPaymentPopupDelegate?
    
    
//    public func configSDK(delegate: HiFPTPaymentPopupDelegate?, allowMethodFoxpay: Bool, isCustomerOfFPT: Bool, baseNav: UINavigationController?, isProduction:Bool) {
//        self.popupDelegate = delegate
//        self.baseNav = baseNav
//        self.allowMethodFoxpay = allowMethodFoxpay
//        self.isCustomerOfFPT = isCustomerOfFPT
//        
//        if allowMethodFoxpay{
//            if isProduction {
//                FoxpaySDKManager.shared.setEnvironment(.product)
//            }else{
//                FoxpaySDKManager.shared.setEnvironment(.staging)
//            }
//        }
//    }
    

    
//    public func logout() {
//        logoutFoxpay()
//        popupDelegate = nil
//    }
    
//    public func pushToPayment(vc: UIViewController, billNumber: String? = nil, selectTabHistory:Bool = false, isEcommercPush: Bool? = false, callBackWebEcommerc: @escaping () -> Void) {
//        PaymentOldManager.shared().pushToPaymentVC(billNumber: billNumber, isShowHistoryFirst: selectTabHistory, vc: vc, isPushWebkitEcommerc: isEcommercPush, callBackWebEcommerc: callBackWebEcommerc)
//    }
//    
//    public func pushToPaymentCheckedBill(vc: UIViewController, listChecked: [String]) {
//        PaymentOldManager.shared().pushToPaymentVC(isShowHistoryFirst: false, listChecked: listChecked, vc: vc, callBackWebEcommerc: {})
//    }
//    
//    public func pushToPaymentMethodController(nav: UINavigationController, endPoint: HiFPTPaymentEndPoint, params: Parameters, orderInfo: OrderInfo, serviceType: String, promotionCode:VoucherItemModel? = nil, referralPhone:String? = nil, isRouterHDI: Bool, hasChangeFee: @escaping(_ dataJson:JSON?, _ statusResult: HiPaymentStatusResult) -> Void, paymentSuccess: @escaping () -> Void, paymentSuccessFree: @escaping () -> Void, close: @escaping(_ isSuccess:Bool) -> Void){
//        PaymentOldManager.shared().pushToPaymentMethodController(nav: nav, endPoint: endPoint, serviceType: serviceType, params: params, orderInfo: orderInfo,promotionCode:promotionCode, referralPhone:referralPhone, isRouterHDI: isRouterHDI, hasChangeFee: hasChangeFee, paymentSuccessFree: paymentSuccessFree, paymentSuccess: paymentSuccess, close: close)
//    }
//    
//    public func pushToMyCard(vc: UIViewController){
//        PaymentOldManager.shared().pushToMyCardVC(vc: vc)
//    }
//    
//    public func pushToPaymentBehalf(vc: UIViewController){
//        PaymentOldManager.shared().pushToPaymentBehalfVC(vc: vc)
//    }
//    
//    public func pushToTopupMobile(vc: UIViewController) {
//        PaymentNewManager.shared().pushToTopupMobile(vc: vc)
//    }
//    
//    func textForCardNumber(number: String) -> String {
//        //970432xxxxxx4915
//        var str = number.replacingOccurrences(of: "x", with: "•")
//        str = str.replacingOccurrences(of: "X", with: "•")
//        str = str.filter { !$0.isNewline && !$0.isWhitespace }
//        if str != "" {
//            str.insert(separator: "  ", every: 4)
//        }
//        return str
//    }
    
    func formatMoneyToString(amnt: Int, currency: String = "đ") -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        if let formatMoney = formatter.string(from: amnt as NSNumber) {
            return formatMoney + currency
        }
        return String(amnt)
    }
    
    func addAttributeForLabel(text1: String, text2: String, attribute1: [NSAttributedString.Key: Any], attribute2: [NSAttributedString.Key: Any]) -> NSMutableAttributedString {
        let txtResult = NSMutableAttributedString()
        
        let txtAttri1 = NSAttributedString.init(string: text1, attributes: attribute1)
        let txtAttri2 = NSAttributedString.init(string: text2, attributes: attribute2)
        
        txtResult.append(txtAttri1)
        txtResult.append(txtAttri2)
        
        return txtResult
    }
    
    func textForBoldNumber(text1: String, number: String) -> NSMutableAttributedString {
        let attriTxt1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let attrNum = [NSAttributedString.Key.foregroundColor: UIColor.black,
                       NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]
        
        return self.addAttributeForLabel(text1: text1, text2: number, attribute1: attriTxt1, attribute2: attrNum)
    }
    
    public func textForBold(text: String, textBold: String, textDetect: String) -> NSMutableAttributedString {
        let arrStr = text.components(separatedBy: textDetect)
        let num = self.textForBoldNumber(text1: arrStr.first!, number: textBold)
        let lastStr = NSAttributedString.init(string: arrStr.last!)
        num.append(lastStr)
        return num
    }
    
    func textForBoldNumberGrey(text1: String, number: String) -> NSMutableAttributedString {
        let attriTxt1 = [NSAttributedString.Key.foregroundColor: UIColor().hexStringToUIColor(hex: ColorKey.textLightBlack), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        let attrNum = [NSAttributedString.Key.foregroundColor: UIColor.black,
                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
        
        return self.addAttributeForLabel(text1: text1, text2: number, attribute1: attriTxt1, attribute2: attrNum)
    }
    
//    func getListBillByType(vc: UIViewController, contractNo: String, handler: @escaping ( (PaymentByTypeModel) ->()))  {
//
//        //Set hard code for test
//        let params: Parameters =  PaymentEndPoint.paramsListBillEContract(contractNo: contractNo)
//        APIManager.shared.callApi(endPoint: PaymentEndPoint.listBillEContract, params: params, signatureHeader: true) { (dataJson, result) in
//            if let json = dataJson?.dictionaryObject {
//               let paymentByType = PaymentByTypeModel.init(js: JSON.init(json))
//                handler(paymentByType)
//            } else {
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//            }
//        }
//    }
//    public func getListBillByTypeEContract(vc: UIViewController, contractNo: String, handler: @escaping ( (PaymentByTypeModel) ->())) {
//        PaymentOldManager.shared().getListBillByType(vc: vc, contractNo: contractNo) { item in
//            handler(item)
//        }
//    }
//    public func presentPayActionVCEContract(vc: UIViewController, title: String,strUrl : String, handleResult: @escaping( _ strResult:String )->Void) {
//        PaymentOldManager.shared().presentPayActionVC(vc: vc, title: title, strUrl: strUrl) { strResult in
//            handleResult(strResult)
//        }
//    }
//    
//    public func presentPayResultVCEContract(vc: UIViewController,strUrl : String, onCallBack: @escaping ((_ result: ResultWebkitType)->Void)) {
//        PaymentOldManager.shared().presentResultWebkit(vc: vc, strUrl: strUrl) { result in
//            onCallBack(result)
//        }
//    }
//    
//    public func showPopupTokenizationCardEContract(vc: UIViewController, title: String, desc : String,isSuccess: Bool, duration: Double = 3.0) {
//        PaymentOldManager.shared().showPopupTokenizationCard(vc: vc, title: title, desc: desc, isSuccess :isSuccess , duration:duration)
//    }
//    
//    public func createAutoPayEContract(vc: UIViewController, contractNo: String, tokenizationId: String, handler: @escaping ( (String) ->())){
//        PaymentOldManager.shared().createAutoPay(vc: vc, contractNo: contractNo, tokenizationId: tokenizationId) { string in
//            handler(string)
//        }
//    }
//    
//    public func pushToAutopayVCEContract(vc: UIViewController, isHasCard: Bool) {
//        PaymentOldManager.shared().pushToAutopayVC(vc: vc, isHasCard: isHasCard)
//    }
//    public func pushToAutopayVCEContractVM(vc: UIViewController,vm: AutoPayDetailVMProtocol, isHasCard: Bool) {
//        PaymentOldManager.shared().pushToAutopayVC(vc: vc, vm: vm, isHasCard: isHasCard)
//    }
//    
//    public func getDetailAutoPayEContract(vc: UIViewController, contractNo: String, handler: @escaping ( (AutopayDetailModel) ->()))  {
//        PaymentOldManager.shared().getDetailAutoPay(vc: vc, contractNo: contractNo) { model in
//            handler(model)
//        }
//    }
//    
//    public func pushToPayBillVCEContract(vc: UIViewController,contractNo:String , listBill:[BillDetail], handleResult: @escaping( _ strResult:String )->Void, handleFoxpayResult: @escaping(_ fpRes: FPSDKPaymentResponse) -> Void) {
//        PaymentOldManager.shared().pushToPayBillVC(vc: vc, contractNo: contractNo, listBill: listBill, isEContract: true) { string in
//            handleResult(string)
//        } handleFoxpayResult: { result in
//            handleFoxpayResult(result)
//        } handleCreateCR: {
//            
//        }
//    }
//    
//    public func presentToPaymentResultFoxpayEContract(vc: UIViewController, typeResult: PaymentResultStatus, billAmount: String = "", foxpayBalance: String = "",actionAccept: @escaping () -> Void, actionClose: @escaping () -> Void) {
//        
//        PaymentOldManager.shared().presentToPaymentResultFoxpay(vc: vc, typeResult: typeResult, billAmount: billAmount, foxpayBalance: foxpayBalance, actionAccept: {
//            actionAccept()
//        }) {
//            actionClose()
//        }
//        
//    }
//    
//    public func getBalanceFoxpay(vc:UIViewController, onSuccess:@escaping(_ balance:Int)->Void, onFail:@escaping()->Void){
//        if (FoxpaySDKManager.shared.isConfigCalled()){
//            FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                 if linked {
//                    onSuccess(balance)
//                 }
//                 else{
//                    FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                        if linked {
//                           onSuccess(balance)
//                        }else{
//                            onFail()
//                        }
//                    }
//                 }
//             }
//        }else{
//            PaymentOldManager.shared().getMerchantIdFoxPay(vc: vc) { (merchantInfo) in
//                let config = FPSDKMerchantConfig(merchantId: merchantInfo.merchantId, sysToken:  merchantInfo.accessToken, linkingToken: merchantInfo.linkToken)
//                FoxpaySDKManager.shared.config(with: config)
//                FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                     if linked {
//                        onSuccess(balance)
//                     }
//                     else{
//                        FoxpaySDKManager.shared.link(from: vc, redirect: false) { (linked, balance, bankInfo) in
//                            if linked {
//                               onSuccess(balance)
//                            }else{
//                                onFail()
//                            }
//                        }
//                     }
//                 }
//            }
//        }
//    }
//    
//    public func openFoxpaySDK(vc:UIViewController) {
//        if (FoxpaySDKManager.shared.isConfigCalled()){
//            FoxpaySDKManager.shared.showSDK(from: vc, initialData: nil)
//        }else{
//            PaymentOldManager.shared().getMerchantIdFoxPay(vc: vc) { (merchantInfo) in
//                let config = FPSDKMerchantConfig(merchantId: merchantInfo.merchantId, sysToken:  merchantInfo.accessToken, linkingToken: merchantInfo.linkToken)
//                FoxpaySDKManager.shared.config(with: config)
//                FoxpaySDKManager.shared.showSDK(from: vc, initialData: nil)
//            }
//        }
//    }
//    
//    public func logoutFoxpay(){
//        FoxpaySDKManager.shared.logout()
//    }
//    
//    public func checkBillByContractIdcheckBillByContractId(vc:UIViewController, contractId:String, onSuccess:@escaping(_ strTotal:String, _ function:String, _ listBill:[BillDetail]) -> Void ){
//        PaymentOldManager.shared().checkBillByContractId(vc: vc, contractId: contractId, onSuccess: onSuccess)
//    }
//    
//    public func paymentBill(vc:UIViewController, contractNo: String, listBill:[BillDetail], isCreateCR: Bool? = false, isRouterHTTT: Bool = false, showWarningPay: Bool = false, process: String? = nil,textType: EcounterWarningTextType, paymentSuccess: @escaping()->Void, close: @escaping(_ isSuccess:Bool) -> Void, handleCR: @escaping() -> Void){
//        PaymentOldManager.shared().paymentBill(vc: vc, contractNo: contractNo, listBill: listBill, isCreateCR: isCreateCR, isRouterHTTT: isRouterHTTT , showWarningPay: showWarningPay, process: process, textType: textType, paymentSuccess: paymentSuccess, close: close, handleCR: handleCR)
//    }
//    
//    public func openFoxpayQRCode(vc:UIViewController){
//        if (FoxpaySDKManager.shared.isConfigCalled()){
//            FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                if linked {
//                    FoxpaySDKManager.shared.showScanQR(from: vc)
//                }else{
//                    FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                        if linked {
//                            FoxpaySDKManager.shared.showScanQR(from: vc)
//                        }
//                    }
//                }
//            }
//        }else{
//            PaymentOldManager.shared().getMerchantIdFoxPay(vc: vc) { (merchantInfo) in
//                let config = FPSDKMerchantConfig(merchantId: merchantInfo.merchantId, sysToken:  merchantInfo.accessToken, linkingToken: merchantInfo.linkToken)
//                FoxpaySDKManager.shared.config(with: config)
//                
//                FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                    if linked {
//                        FoxpaySDKManager.shared.showScanQR(from: vc)
//                    }else{
//                        FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                            if linked {
//                                FoxpaySDKManager.shared.showScanQR(from: vc)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    public func openFoxpayBillPaymentById(vc:UIViewController, billId:Int, categoryName:String){
//        if (FoxpaySDKManager.shared.isConfigCalled()){
//            FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                if linked {
//                    FoxpaySDKManager.shared.showBillPayment(from: vc, billID: billId, categoryName: categoryName)
//                }else{
//                    FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                        if linked {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                FoxpaySDKManager.shared.showBillPayment(from: vc, billID: billId, categoryName: categoryName)
//                            }
//                        }
//                    }
//                }
//            }
//        }else{
//            PaymentOldManager.shared().getMerchantIdFoxPay(vc: vc) { (merchantInfo) in
//                let config = FPSDKMerchantConfig(merchantId: merchantInfo.merchantId, sysToken:  merchantInfo.accessToken, linkingToken: merchantInfo.linkToken)
//                FoxpaySDKManager.shared.config(with: config)
//                
//                FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                    if linked {
//                        //FoxpaySDKManager.shared.showBillPayment(from: vc, billID: billId, categoryName: categoryName)
//                        FoxpaySDKManager.shared.showBillPayment(from: vc.topMostViewController(), billID: billId, categoryName: categoryName)
//                    }else{
//                        FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                            if linked {
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                    //FoxpaySDKManager.shared.showBillPayment(from: vc, billID: billId, categoryName: categoryName)
//                                    FoxpaySDKManager.shared.showBillPayment(from: vc.topMostViewController(), billID: billId, categoryName: categoryName)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    public func paymentECom(nav: UINavigationController, dataJS: JSON, popMethodPay: @escaping () -> Void, promotionCode:String? = nil, referralCode:String? = nil, paymentSuccess: @escaping (_ transId:String, _ orderId:String) -> Void, close: @escaping(_ transId:String, _ orderId:String) -> Void){
//        PaymentOldManager.shared().pushToEComPaymentMethodController(nav: nav, dataJS: dataJS, popMethodPay: popMethodPay, paymentSuccess: paymentSuccess, close: close)
//    }
//    
//    public func showFoxpayCashIn(vc: UIViewController){
//        if (FoxpaySDKManager.shared.isConfigCalled()){
//            FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                if linked {
//                    FoxpaySDKManager.shared.showCashIn(from: vc, completion: { balance in
//                        
//                    })
//                }else{
//                    FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                        if linked {
//                            FoxpaySDKManager.shared.showCashIn(from: vc, completion: { balance in
//                                
//                            })
//                        }
//                    }
//                }
//            }
//        }else{
//            PaymentOldManager.shared().getMerchantIdFoxPay(vc: vc) { (merchantInfo) in
//                let config = FPSDKMerchantConfig(merchantId: merchantInfo.merchantId, sysToken:  merchantInfo.accessToken, linkingToken: merchantInfo.linkToken)
//                FoxpaySDKManager.shared.config(with: config)
//                
//                FoxpaySDKManager.shared.checkLinked { (linked, balance, bankInfo) in
//                    if linked {
//                        //FoxpaySDKManager.shared.showBillPayment(from: vc, billID: billId, categoryName: categoryName)
//                        FoxpaySDKManager.shared.showCashIn(from: vc, completion: { balance in
//                            
//                        })
//                    }else{
//                        FoxpaySDKManager.shared.link(from: vc, redirect: true) { (linked, balance, bankInfo) in
//                            if linked {
//                                FoxpaySDKManager.shared.showCashIn(from: vc, completion: { balance in
//                                    
//                                })
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
}

