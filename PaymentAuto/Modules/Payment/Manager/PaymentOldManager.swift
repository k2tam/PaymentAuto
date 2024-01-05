//
//  PaymentOldManager.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit
import SwiftyJSON
import Alamofire


public enum PaymentResultStatus {
    case SUCCESS
    case SUCCESSAUTOPAY //- Không thấy sử dụng - QuocL note
    case FAILURE
    case SUCCESS_WITHOUT_PAYMENTMETHOD
}

class PaymentOldManager: NSObject {
    static var myClass: PaymentOldManager?
    static func shared()->PaymentOldManager{
        if(myClass == nil){
            myClass = PaymentOldManager()
        }
        return myClass ?? PaymentOldManager()
    }
    
    func getPaymentMethods(vc: UIViewController, contractId: String, handler: @escaping ( ([PaymentMethodModel]) ->()))  {
        
        //Set hard code for test
        let params: Parameters =  PaymentOldEndPoint.paramsPaymentMethod(contractId: contractId)
        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.PaymentMethod, params: params, signatureHeader: true) { (dataJson, result) in
            if let json = dataJson?.arrayObject {
                var arr: [PaymentMethodModel] = []
                for js in json {
                    let method = PaymentMethodModel.init(js: JSON.init(js))
                    arr.append(method)
                }
                handler(arr)
            } else {
                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
            }
        }
    }
    
//    func getDetailAutoPay(vc: UIViewController, contractNo: String, handler: @escaping ( (AutopayDetailModel) ->()))  {
//        
//        //Set hard code for test
//        let params: Parameters =  PaymentOldEndPoint.paramsAutoPayDetail(contractNo: contractNo)
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.AutoPayDetail, params: params, signatureHeader: true) { (dataJson, result) in
//            if let json = dataJson?.dictionaryObject {
//                let detail = AutopayDetailModel.init(js: JSON.init(json))
//                handler(detail)
//            } else {
//                if result.statusCode == HiPaymentStatusCode.PAYMENT_DATA_NULL.rawValue {
//                    handler(AutopayDetailModel.init())
//                } else {
//                    HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//                }
//            }
//        }
//        
//    }
    func createAutoPay(vc: UIViewController, contractNo: String, tokenizationId: String, referer: OTPType = .NONE, handler: @escaping ( (String) ->()))  {
        
        //Set hard code for test
        let params: Parameters =  PaymentOldEndPoint.paramsCreateAutoPay(contractNo: contractNo, tokenizationId: tokenizationId, referer: referer)
        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.createAutoPay, params: params, signatureHeader: true) { (dataJson, result) in
            if result.statusCode == 0 {
                handler(result.message)
            } else {
                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
            }
        }
    }
    
    func deleteAutoPay(vc: UIViewController, autopayId: String, methodKey: String, phone: String, handler: @escaping ( (HiPaymentStatusResult) ->()))  {
        
        //Set hard code for test
        let params: Parameters =  PaymentOldEndPoint.paramsDeleteAutoPay(autopayId: autopayId, methodKey: methodKey, phone: phone)
        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.DeleteAutoPay, params: params, signatureHeader: true) { (dataJson, result) in
            if result.statusCode == 0 {
                handler(result)
            } else {
                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
            }
        }
    }
    
//    func editAutoPay(vc: UIViewController, autopayId: String, tokenizationId: String, contractNo: String, handler: @escaping ( (String) ->()))  {
//        
//        //Set hard code for test
//        let params: Parameters =  PaymentOldEndPoint.paramsEditAutoPay(contractNo: contractNo, tokenizationId: tokenizationId, autopayId: autopayId)
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.editAutoPay, params: params, signatureHeader: true) { (dataJson, result) in
//            if result.statusCode == 0 {
//                handler(result.message)
//            } else {
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//            }
//        }
//    }
    
//    func getListBillByType(vc: UIViewController, contractNo: String, handler: @escaping ( (PaymentByTypeModel) ->()))  {
//        
//        //Set hard code for test
//        let params: Parameters =  PaymentOldEndPoint.paramsListBillEContract(contractNo: contractNo)
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.listBillEContract, params: params, signatureHeader: true) { (dataJson, result) in
//            if let json = dataJson?.dictionaryObject {
//               let paymentByType = PaymentByTypeModel.init(js: JSON.init(json))
//                handler(paymentByType)
//            } else {
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//            }
//        }
//    }
//    
//    func pushToPaymentVC(billNumber: String? = nil, isShowHistoryFirst:Bool = false,listChecked:[String] = [], vc: UIViewController, isPushWebkitEcommerc: Bool? = false, callBackWebEcommerc: @escaping () -> Void )  {
//        let paymentVC = UIStoryboard(name: "PaymentOld", bundle: nil).instantiateViewController(withIdentifier:"paymentOldController") as! PaymentController
//        paymentVC.isShowHistoryFirst = isShowHistoryFirst
//        if listChecked.count > 0{
//            paymentVC.listChecked = listChecked
//        }
//        paymentVC.billNumber = billNumber
//        paymentVC.isPushFromWebkitEcommerc = isPushWebkitEcommerc
//        paymentVC.callbaclWebkitEcommerc = callBackWebEcommerc
//        vc.pushViewControllerHiF(paymentVC, animated: true)
//    }
//    
//    func pushToPaymentAfterPayBehalfSuccess(vc: UIViewController)  {
//        //Hàm để push vào PaymentController khi CHƯA TỒN TẠI trong view stack từ PaymentBehalfVC
//        let paymentVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"paymentOldController") as! PaymentController
//        paymentVC.isPushFromPayBehalf = true
//        vc.pushViewControllerHiF(paymentVC, animated: true)
//    }
//
//    
//    func pushToPayBillVC(vc: UIViewController,contractNo:String , listBill:[BillDetail],isEContract: Bool = false, isCreateCR: Bool? = false, showWarningPay: Bool = false, process: String? = nil, textType: EcounterWarningTextType = .relocation,handleResult: @escaping( _ strResult:String )->Void, handleFoxpayResult: @escaping(_ fpRes: FPSDKPaymentResponse) -> Void, handleCreateCR: @escaping()->Void)  {
//        let payVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"payBillController") as! PayBillController
//        payVC.contractNo = contractNo
//        payVC.listBill = listBill
//        payVC.onResult = handleResult
//        payVC.onResultFoxpay = handleFoxpayResult
//        payVC.isEContract = isEContract
//        //6.2
//        payVC.isCreateCR = isCreateCR ?? false
//        payVC.callBackCreateCR = handleCreateCR
//        payVC.showWarningPay = showWarningPay
//        payVC.process = process
//        payVC.textType = textType
//        vc.pushViewControllerHiF(payVC, animated: true)
//    }
//    
//    
//    
//    func pushToPayBillBehalfVC(vc: UIViewController, contractNo:String , listBill:[BillDetail], handleResult: @escaping( _ strResult:String )->Void, handleFoxpayResult: @escaping(_ fpRes: FPSDKPaymentResponse) -> Void)  {
//        let payVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"payBillController") as! PayBillController
//        payVC.contractNo = contractNo
//        payVC.listBill = listBill
//        payVC.onResult = handleResult
//        payVC.onResultFoxpay = handleFoxpayResult
//        payVC.isPayBehalf = true
//        vc.pushViewControllerHiF(payVC, animated: true)
//    }
//    
//    func pushToMyCardVC(vc: UIViewController)  {
//        let payVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"myCardController") as! MyCardController
//        vc.pushViewControllerHiF(payVC, animated: true)
//    }
//    
//    func presentPopupIntroductTokenization(isShowForInternationalCard:Bool = false, vc: UIViewController)  {
//        let popup = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupIntroductTokenizationController") as! PopupIntroductTokenizationController
//        popup.modalPresentationStyle = .overCurrentContext
//        popup.isPresentForInternationalCard = isShowForInternationalCard
//        vc.present(popup, animated: false, completion: nil)
//    }
//    
//    func presentPopupMethodSelect(vc: UIViewController, serviceType: String, contractNo: String, currentMethod:PayMethod?, handleDidSelect: @escaping( _ item:PayMethod )->Void)  {
//        let methodVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupMethodSelectController") as! PopupMethodSelectController
//        methodVC.modalPresentationStyle = .overCurrentContext
//        if(currentMethod != nil){
//            methodVC.itemSelected = currentMethod
//        }
//        methodVC.onDidSelect = handleDidSelect
//        methodVC.currentServiceType = serviceType
//        methodVC.currentContractNo = contractNo
//        vc.present(methodVC, animated: true)
//    }
//    
//    func dataJSONToPaymentBehalfModel(listData: [JSON]) -> [PaymentBehalfModel] {
//        var historyList:[PaymentBehalfModel] = []
//        for data in listData {
//            historyList.append(PaymentBehalfModel(contractNo: data["contractNo"].stringValue, name: data["name"].stringValue))
//        }
//        return historyList
//    }
//    
//    func callAPIPushToPaymentBehalf(vc: UIViewController) {
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.historyPaymentBehalf, params: nil, signatureHeader: true) { (dataJSON, result) in
//            if let data = dataJSON {
//                PaymentOldManager.shared().pushToPaymentBehalfSearchVC(historyLs: self.dataJSONToPaymentBehalfModel(listData: data.arrayValue), vc: vc)
//            }
//            else {
//                if (result.statusCode == HiPaymentStatusCode.DATA_NULL.rawValue) {
//                    PaymentOldManager.shared().pushToPaymentBehalfSearchVC(historyLs: [], vc: vc)
//                }
//                else {
//                    HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//                }
//                
//            }
//        }
//    }
//    
//    //Foxpay error cases
//    func presentPopupMethodWhenError(vc: UIViewController, serviceType: String, contractNo: String, errorDesc: String, currentMethod:PayMethod?, bankInfo: String, moneyCurrent: String?, handleDidSelect: @escaping( _ item:PayMethod )->Void)  {
//        let methodVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupMethodSelectController") as! PopupMethodSelectController
//        methodVC.modalPresentationStyle = .overCurrentContext
//        if(currentMethod != nil){
//            methodVC.itemSelected = currentMethod
//        }
//        methodVC.onDidSelect = handleDidSelect
//        methodVC.isFoxpayFailed = true
//        methodVC.bankInfo = bankInfo
//        methodVC.currentServiceType = serviceType
//        methodVC.currentContractNo = contractNo
//        methodVC.errorFoxpay = errorDesc
//        methodVC.moneyCurrent = moneyCurrent
//        vc.present(methodVC, animated: true)
//    }
//    
//    func presentPopupMethodAutoPay(vc: UIViewController, serviceType: String, contractNo: String, currentMethod:PayMethod? , handleDidSelect: @escaping( _ item:PayMethod )->Void)  {
//        let methodVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupMethodSelectController") as! PopupMethodSelectController
//        methodVC.modalPresentationStyle = .overCurrentContext
//        if(currentMethod != nil){
//            methodVC.itemSelected = currentMethod
//        }
//        methodVC.onDidSelect = handleDidSelect
//        methodVC.isAutoPay = true
//        methodVC.currentServiceType = serviceType
//        methodVC.currentContractNo = contractNo
//        vc.present(methodVC, animated: true)
//    }
//    
//    //MARK: Only tokenization
//    func presentPopupOnlyTokenizattion(vc: UIViewController, serviceType: String, contractNo: String, handleDidSelect: @escaping( _ item:PayMethod )->Void)  {
//        let methodVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupMethodSelectController") as! PopupMethodSelectController
//        methodVC.modalPresentationStyle = .overCurrentContext
//        
//        methodVC.onDidSelect = handleDidSelect
//        methodVC.isTokenization = true
//        methodVC.currentServiceType = serviceType
//        methodVC.currentContractNo = contractNo
//        vc.present(methodVC, animated: true)
//    }
//    
//    func presentPayActionVC(vc: UIViewController,title:String, strUrl:String, routerMyCard: Bool = false , handleResult: @escaping( _ strResult:String )->Void)  {
//        let payActionVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"payActionController") as! PayActionController
//        payActionVC.mTitle = title
//        payActionVC.strUrl = strUrl
//        payActionVC.onResult = handleResult
//        payActionVC.routerMyCard = routerMyCard
//        payActionVC.modalPresentationStyle = .fullScreen
//        vc.present(payActionVC, animated: true)
//    }
//    
//    func presentPayResultVC(vc: UIViewController,strUrl:String, handleForTokenization: @escaping ((_ isSuccess: Bool)->Void), handleBackHome: @escaping ((_ isSuccess: Bool)->Void), handleRetryPay: @escaping ((_ isMBSCancel:Bool )->Void) , handleRetryTokenization: @escaping (()->Void), handleRegisterAutopay: @escaping ((_ tokenId:Int)->Void) , paySuccess: @escaping ((_ isEContract:Bool)->Void))  {
//        let resultVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"payResultController") as! PayResultController
//        resultVC.strUrl = strUrl
//        resultVC.actionCallbackTokenization = { dataCallbackSuccess in
//            handleForTokenization(dataCallbackSuccess)
//        }
//        resultVC.actionBackHome = { isSuccess in
//            handleBackHome(isSuccess)
//        }
//        resultVC.retryPay = { isCancel in
//            handleRetryPay(isCancel)
//        }
//        resultVC.retryTokenization = {
//            handleRetryTokenization()
//        }
//        resultVC.registerAutopay = { tokenId in
//            handleRegisterAutopay(tokenId)
//        }
//        resultVC.paySuccess = { isEContract in
//            paySuccess(isEContract)
//        }
//        resultVC.modalPresentationStyle = .fullScreen
//        vc.present(resultVC, animated: true)
//    }
//    
//    func showMsg(vc: UIViewController,title:String, desc:NSMutableAttributedString? , handlerLeftAction: @escaping()->Void, handlerRightAction: @escaping()->Void)  {
//        let msgVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupShowMsgController") as! PopupShowMsgController
//        msgVC.modalPresentationStyle = .overCurrentContext
//        msgVC.strTitle = title
//        if(desc != nil){
//            msgVC.attrDesc = desc
//        }
//        msgVC.actionManagerAutopay = {
//            handlerLeftAction()
//        }
//        msgVC.actionClose = {
//            handlerRightAction()
//        }
//        vc.present(msgVC, animated: true)
//    }
//    
//    func presentBankSupportVC(vc: UIViewController, handleContinue: @escaping()->Void)  {
//        let bankSupport = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupBankSupportController") as! PopupBankSupportController
//        bankSupport.modalPresentationStyle = .overCurrentContext
//        bankSupport.onContinue = handleContinue
//        vc.present(bankSupport, animated: true)
//    }
//    
//    func presentBankSupportVCNoContBnt(vc: UIViewController)  {
//        let bankSupport = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupBankSupportController") as! PopupBankSupportController
//        bankSupport.modalPresentationStyle = .overCurrentContext
//        bankSupport.onContinue = {}
//        bankSupport.isShowContBnt = false
//        vc.present(bankSupport, animated: true)
//    }
//    
//    func presentPolicyTokenizationVC(vc: UIViewController)  {
//        let policyToken = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupPolicyTokenizationController") as! PopupPolicyTokenizationController
//        policyToken.modalPresentationStyle = .overCurrentContext
//        vc.present(policyToken, animated: true)
//    }
//    func pushToPaymentBehalfVC(isPushFromSearchHome:Bool = false, vc: UIViewController)  {
//        let payBehalfVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PaymentBehalfVC") as! PaymentBehalfVC
//        payBehalfVC.isPushFromSearchHome = isPushFromSearchHome
//        vc.pushViewControllerHiF(payBehalfVC, animated: true)
//    }
//    
//    func pushToPaymentBehalfSearchVC(historyLs:[PaymentBehalfModel], vc: UIViewController)  {
//        let payBehalfVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PaymentBehalfSearchVC") as! PaymentBehalfSearchVC
//        payBehalfVC.historyList = historyLs
//        vc.pushViewControllerHiF(payBehalfVC, animated: true)
//    }
//    
//    func presentPaymentBehalfSearchVC(historyLs:[PaymentBehalfModel], isPresentFromHistoryList:Bool, contractNo:String, vc: UIViewController)  {
//        let payBehalfVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PaymentBehalfSearchVC") as! PaymentBehalfSearchVC
//        payBehalfVC.historyList = historyLs
//        payBehalfVC.isPresentFromHistoryListSuperView = isPresentFromHistoryList
//        payBehalfVC.curContractNo = contractNo
//        vc.pushViewControllerHiF(payBehalfVC, animated: true)
//    }
//    
//    func pushToPaymentMethods(vc: UIViewController, contractId: String, methodVM: PaymentMethodVMProtocol) {
//        let paymentVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PaymentCancelVC") as! PaymentCancelVC
//        paymentVC.contractId = contractId
//        paymentVC.methodVM = methodVM
//        vc.pushViewControllerHiF(paymentVC, animated: true)
//    }
//
//    func pushToPaymentMethods(vc: UIViewController, contractId: String, autopayID: String) {
//        let paymentVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PaymentCancelVC") as! PaymentCancelVC
//        paymentVC.autopayId = autopayID
//        paymentVC.contractId = contractId
//        vc.pushViewControllerHiF(paymentVC, animated: true)
//    }
//    
//    func pushToAutopayDetail(vc: UIViewController, isRegister: Bool, isHiddenContract: Bool = false, referer: OTPType = .NONE, successRegisterAutoPay: @escaping(() -> Void)) {
//        let autoPayInfoVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayInfoVC") as! AutoPayInfoVC
//        autoPayInfoVC.isRegister = isRegister
//        autoPayInfoVC.successRegisterAutoPay = successRegisterAutoPay
//        autoPayInfoVC.isHiddenContract = isHiddenContract
//        autoPayInfoVC.referer = referer
//        vc.pushViewControllerHiF(autoPayInfoVC, animated: true)
//    }
//    
//    func pushToAutopayDetail(vc: UIViewController, isRegister: Bool, autopayVM: AutoPayDetailVMProtocol) {
//        let autoPayInfoVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayInfoVC") as! AutoPayInfoVC
//        autoPayInfoVC.isRegister = isRegister
//        autoPayInfoVC.autopayVM = autopayVM
//        vc.pushViewControllerHiF(autoPayInfoVC, animated: true)
//    }
//
//    
//    func pushToAutopayVC(vc: UIViewController) {
//        let autoPayVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayVC") as! AutoPayVC
//        vc.pushViewControllerHiF(autoPayVC, animated: true)
//    }
//    
//    func pushToAutopayVC(vc: UIViewController, vm: AutoPayDetailVMProtocol, isHasCard: Bool) {
//        let autoPayVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayVC") as! AutoPayVC
//        autoPayVC.autopayVM = vm
//        autoPayVC.isHasCard = isHasCard
//        vc.pushViewControllerHiF(autoPayVC, animated: true)
//    }
//    
//    func pushToAutopayVC(vc: UIViewController, isHasCard: Bool) {
//        let autoPayVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayVC") as! AutoPayVC
//        autoPayVC.isHasCard = isHasCard
//        vc.pushViewControllerHiF(autoPayVC, animated: true)
//    }
//    
//    func pushToAutopayVC(vc: UIViewController, isHasCard: Bool, afterPayment: Bool) {
//        let autoPayVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayVC") as! AutoPayVC
//        autoPayVC.isHasCard = isHasCard
//        autoPayVC.isRegisterAutoPayAfterPayment = afterPayment
//        vc.pushViewControllerHiF(autoPayVC, animated: true)
//    }
//    
//    func pushToAutopayOrAutopayDetailVC(vc: UIViewController, contractNo: String) {
//        let autoPayVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"AutoPayVC") as! AutoPayVC
//        autoPayVC.isNeedPushDetail = true
//        autoPayVC.contractNo = contractNo
//        vc.pushViewControllerHiF(autoPayVC, animated: true)
//    }
//    
//    func showPopupTokenizationCard(vc: UIViewController,title:String, desc:String, isSuccess: Bool, duration: Double = 3.0)  {
//        let tokenVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"popupTokenizationCardVC") as! PopupTokenizationCard
//        tokenVC.modalPresentationStyle = .overCurrentContext
//        tokenVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        tokenVC.strTitle = title
//        tokenVC.strDesc = desc
//        tokenVC.isSuccess = isSuccess
//        tokenVC.setupDataUI()
//        vc.present(tokenVC, animated: true)
//    }
//    
//    func getInternetBill(vc: UIViewController, billNumber: String, handler: @escaping ( (_ urlString: String, _ typeFormat: String) ->()))  {
//        let params: Parameters =  PaymentOldEndPoint.paramsViewInternetBill(billNumber: billNumber)
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.viewInternetBill, params: params, signatureHeader: true) { (dataJson, result) in
//            if let json = dataJson {
//                handler(json["url"].stringValue, json["type"].stringValue)
//            } else {
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//            }
//        }
//    }
//    
//    func pushToInternetBilling(vc: UIViewController,  billNumber: String, contractNo: String?) {
//        self.getInternetBill(vc: vc, billNumber: billNumber) { (strURL, typeFormat)  in
//            let internetBillVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"internetBillViewControlller") as!  InternetBillViewControlller
//            internetBillVC.urlPDFBill  = URL(string: strURL)
//            internetBillVC.typeViewBill  = typeFormat
//            internetBillVC.billNumber = billNumber
//            internetBillVC.contractNo = contractNo
//            if vc.isKind(of: BaseNavigation.self) {
//                if let nav = vc as? BaseNavigation {
//                    nav.pushViewController(internetBillVC, animated: true)
//                }
//            } else {
//                vc.navigationController?.pushViewController(internetBillVC, animated: true)
//            }
//            
//        }
//    }
//    
//    func dowloadInternetBill(vc: UIViewController, billNumber: String, handler: @escaping ( (_ urlString: String) ->()))  {
//        let params: Parameters =  PaymentOldEndPoint.paramsdowloadInternetBill(billNumber: billNumber)
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.dowloadInternetBill, params: params, signatureHeader: true, vc: vc) { (dataJson, result) in
//            if let json = dataJson {
//                handler(json["url"].stringValue)
//            } else {
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//            }
//        }
//    }
//    func presentToPaymentResultSuccess(vc: UIViewController,modelPayment: CheckFreeVoucherModel, typeResult: PaymentResultStatus = .SUCCESS_WITHOUT_PAYMENTMETHOD, isRouterHTTT: Bool = false, flowPaymentFree: Bool = false, actionAccept: @escaping () -> Void, actionClose: @escaping () -> Void) {
//        let paymentResult = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier: Constants.StoryboardId.kPaymentResultVC) as! PaymentResultVC
//        paymentResult.paymentType = typeResult
//        paymentResult.actionConfirm = actionAccept
//        paymentResult.actionClose = actionClose
//        paymentResult.isRouterHTTT = isRouterHTTT
//        paymentResult.billAmount = modelPayment.amountText
//        paymentResult.descSuccessWithouPaymentMethod = modelPayment.content.body
//        paymentResult.flowPaymentFree = flowPaymentFree
//        paymentResult.modalPresentationStyle = .overCurrentContext
//        vc.present(paymentResult, animated: true, completion: nil)
//    }
//    //5.7 Foxpay
//    func presentToPaymentResultFoxpay(vc: UIViewController, typeResult: PaymentResultStatus, isRouterHTTT: Bool = false, billAmount: String = "", foxpayBalance: String = "",actionAccept: @escaping () -> Void, actionClose: @escaping () -> Void) {
//        let paymentResult = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier: Constants.StoryboardId.kPaymentResultVC) as! PaymentResultVC
//        paymentResult.paymentType = typeResult
//        paymentResult.actionConfirm = actionAccept
//        paymentResult.actionClose = actionClose
//        paymentResult.billAmount = billAmount
//        paymentResult.walletBln = foxpayBalance
//        paymentResult.isRouterHTTT = isRouterHTTT
//        paymentResult.modalPresentationStyle = .overCurrentContext
//        vc.present(paymentResult, animated: true, completion: nil)
//    }
//    
//    func presentToPaymentResultFoxpayFailed(vc: UIViewController, errorDesc: String ,actionAccept: @escaping () -> Void, actionClose: @escaping () -> Void) {
//        let paymentResult = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier: Constants.StoryboardId.kPaymentResultVC) as! PaymentResultVC
//        paymentResult.paymentType = .FAILURE
//        paymentResult.actionConfirm = actionAccept
//        paymentResult.actionClose = actionClose
//        paymentResult.billAmount = ""
//        paymentResult.walletBln = ""
//        paymentResult.errorTitle = errorDesc
//        paymentResult.modalPresentationStyle = .overCurrentContext
//        vc.present(paymentResult, animated: true, completion: nil)
//    }
//
//    
//    func getMerchantIdFoxPay(vc: UIViewController, completion: @escaping (_ merchantInfo: MerchantModel ) -> Void) {
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.GetMerchantFoxpay, params: nil, signatureHeader: true, optionalHeaders: nil, showProgressLoading: true, vc: HiPaymentAPIManager.shared.getCurrentController()) { (json, result) in
//            if result.statusCode == 0 {
//                completion(MerchantModel().parseItemtoMerchant(json: json ?? JSON()))
//            }
//            else
//            {
//                HiThemesPopupManager.share().presentToPopupVC(
//                    vc: vc,
//                    type: .alert(
//                        title: Localizable.shared.localizedString(key: "notification", comment: ""),
//                        content: NSMutableAttributedString(string: result.message), titleRightBtn: Localizable.shared.localizedString(key: "close", comment: ""), actionRightBtn: {}))
//            }
//        }
//    }
//    
//    func apiCheckLinkToken(vc: UIViewController, linkToken: String, completion: @escaping ( ) -> Void) {
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.checkLinkTokenFoxpay, params: PaymentOldEndPoint.paramsCheckLinkTokenFoxpay(linkToken: linkToken), signatureHeader: true, optionalHeaders: nil, showProgressLoading: false, vc: nil) { (json, result) in
//            if result.statusCode == 0 {
//                completion()
//            }
//        }
//        
//    }
//    
//    //MARK: v6.0
//    func pushToPaymentMethodController(nav: UINavigationController,endPoint:HiFPTPaymentEndPoint, serviceType: String, params:Parameters, orderInfo:OrderInfo,promotionCode:VoucherItemModel? = nil, referralPhone:String? = nil, isRouterHDI: Bool , hasChangeFee: @escaping( _ dataJson:JSON?, _ statusResult: HiPaymentStatusResult) ->Void, paymentSuccessFree: (() -> Void)?, paymentSuccess: @escaping()->Void, close: @escaping(_ isSuccess:Bool) -> Void)  {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        let payVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PaymentMethodController") as! PaymentMethodController
//        payVC.endPoint = endPoint
//        payVC.params = params
//        payVC.orderInfo = orderInfo
//        payVC.serviceType = serviceType
//        payVC.onChangeFee = hasChangeFee
//        payVC.paymentSuccessFree = paymentSuccessFree
//        payVC.isRouterHDI = isRouterHDI
//        if let promoCode = promotionCode{
//            payVC.promotionCode = promoCode
//        }
//        if let referPhone = referralPhone{
//            payVC.referralPhone = referPhone
//        }
//        
//        payVC.openPaymentWebkit = { linkPayment, titlePayment in
//            if let vc = nav.topViewController{
//                PaymentOldManager.shared().presentPaymentWebkit(vc: vc, title: titlePayment, strUrl: linkPayment) { strUrl in
//                    vc.dismiss(animated: true) {
//                        PaymentOldManager.shared().presentResultWebkit(vc: vc, strUrl: strUrl) { resultType in
//                            switch (resultType){
//                            case .paymentRetry:
//                                self.pushToPaymentMethodController(nav: nav, endPoint: endPoint, serviceType: serviceType, params: params, orderInfo: orderInfo, promotionCode: promotionCode, referralPhone: referralPhone, isRouterHDI: isRouterHDI, hasChangeFee: hasChangeFee, paymentSuccessFree: paymentSuccessFree, paymentSuccess: paymentSuccess, close: close)
//                                break
//                            case .backHome(let isSuccess):
//                                close(isSuccess)
//                                break
//                            case .paymentSuccess:
//                                paymentSuccess()
//                                break
//                            case .registerAutopay(_):
//                                break
//                            case .retryRegisterTokenization:
//                                break
//                            }
//                        }
//                        
//                    }
//                } handleOnClose: {}
//            }
//        }
//        payVC.onResultFoxpay = { result in
//            PaymentOldManager.shared().presentToPaymentResultFoxpay(vc: nav.topViewController!, typeResult: .SUCCESS, billAmount: HiFPTPayment.shared.formatMoneyToString(amnt: result.amount), foxpayBalance: HiFPTPayment.shared.formatMoneyToString(amnt: result.balance), actionAccept: {
//                    paymentSuccess()
//            }) {
//                close(true)
//            }
//            MyGlobal.shared().needReloadBalanceFoxpay = true
//        }
//        payVC.closeExpiredPopup = { result in
//            close(result)
//        }
//        nav.pushViewController(payVC, animated: true)
//    }
//    
//    func pushToEComPaymentMethodController(nav: UINavigationController, dataJS:JSON, popMethodPay: @escaping () -> Void, paymentSuccess: @escaping(_ transId:String, _ orderId:String)->Void, close: @escaping(_ transId:String, _ orderId:String) -> Void)  {
//        let payVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"EcomPaymentMethodController") as! EcomPaymentMethodController
//        payVC.dataJS = dataJS
//        payVC.callbackCloseMethod = popMethodPay
//        payVC.successFreeVoucher = paymentSuccess
//        payVC.openPaymentWebkit = {transId, orderId, linkPayment, titlePayment in
//            if let vc = nav.topViewController{
//                PaymentOldManager.shared().presentPaymentWebkit(vc: vc, title: titlePayment, strUrl: linkPayment) { strUrl in
//                    vc.dismiss(animated: true) {
//                        PaymentOldManager.shared().presentResultWebkit(vc: MyGlobal.shared().baseNav?.topMostViewController() ?? UIViewController(), strUrl: strUrl) { [weak self] resultType in
//                            switch (resultType){
//                            case .paymentRetry:
//                                self?.pushToEComPaymentMethodController(nav: nav, dataJS: dataJS, popMethodPay: popMethodPay, paymentSuccess: paymentSuccess, close: close)
//                                break
//                            case .backHome:
//                                close(transId, orderId)
//                                break
//                            case .paymentSuccess:
//                                paymentSuccess(transId, orderId)
//                                break
//                            case .registerAutopay(_):
//                                break
//                            case .retryRegisterTokenization:
//                                break
//                            }
//                        }
//                    }
//                } handleOnClose: {
//                    close(transId, orderId)
//                }
//            }
//        }
//        payVC.onResultFoxpay = { transId, orderId, result in
//            PaymentOldManager.shared().presentToPaymentResultFoxpay(vc: nav.topViewController!, typeResult: .SUCCESS, billAmount: HiFPTPayment.shared.formatMoneyToString(amnt: result.amount), foxpayBalance: HiFPTPayment.shared.formatMoneyToString(amnt: result.balance), actionAccept: {
//                paymentSuccess(transId, orderId)
//            }) {
//                close(transId, orderId)
//            }
//            MyGlobal.shared().needReloadBalanceFoxpay = true
//        }
//        nav.pushViewControllerHiF(payVC, animated: true)
//    }
//    
//    func presentPaymentWebkit(vc: UIViewController,title:String, strUrl:String , handleResult: @escaping( _ strResult:String )->Void, handleOnClose: (() -> Void)?)  {
//        let payActionVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: type(of: self))).instantiateViewController(withIdentifier:"PaymentWebkitController") as! PaymentWebkitController
//        payActionVC.mTitle = title
//        payActionVC.strUrl = strUrl
//        payActionVC.onResult = handleResult
//        payActionVC.callBackClose = handleOnClose
//        payActionVC.modalPresentationStyle = .fullScreen
//        vc.present(payActionVC, animated: true)
//    }
//    
//    func presentResultWebkit(vc: UIViewController,strUrl:String, onCallBack: @escaping ((_ result: ResultWebkitType)->Void))  {
//        let resultVC = ResultWebkitController()
//        resultVC.strUrl = strUrl
//        resultVC.onCallBack = onCallBack
//        resultVC.modalPresentationStyle = .fullScreen
//        //APIManager.shared.getNavigationController().dismiss(animated: true) {
//            vc.present(resultVC, animated: true)
//        //}
//        
//    }
//    
//    func presentPopupChoiceMethod(vc: UIViewController, serviceType: String, contractNo: String, currentMethod:PayMethod? , handleDidSelect: @escaping( _ item:PayMethod )->Void)  {
//        let methodVC = UIStoryboard(name: "PaymentOld", bundle: Bundle(for: PaymentOldManager.self)).instantiateViewController(withIdentifier:"PopupChoiceMethodController") as! PopupChoiceMethodController
//        methodVC.modalPresentationStyle = .overCurrentContext
//        if(currentMethod != nil){
//            methodVC.itemSelected = currentMethod
//        }
//        methodVC.onDidSelect = handleDidSelect
//        methodVC.currentServiceType = serviceType
//        methodVC.currentContractNo = contractNo
//        vc.present(methodVC, animated: true)
//    }
//    
//    func checkBillByContractId(vc:UIViewController, contractId:String, onSuccess:@escaping(_ strTotal:String, _ function:String, _ listBill:[BillDetail]) -> Void ){
//        let params: Parameters =  PaymentOldEndPoint.paramsCheckBillByContractId(contractId: contractId)
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.checkBillByContractId, params: params, signatureHeader: true, vc: vc) { (dataJson, result) in
//            if let json = dataJson {
//                
//                var items:[BillDetail] = []
//                if let receiptsJSON = json["dataNapas"]["listReceipts"].array{
//                    for itemJson in receiptsJSON {
//                        let item = BillDetail(json: itemJson, functionPay: "")
//                        items.append(item)
//                    }
//                }
//                if let billsJSON = json["dataNapas"]["listBills"].array{
//                    for itemJson in billsJSON {
//                        let item = BillDetail(json: itemJson, functionPay: "")
//                        items.append(item)
//                    }
//                }
//                let strTotal = json["label"].stringValue
//                let function = json["function"].stringValue
//                
//                onSuccess(strTotal, function, items)
//            } else if result.statusCode == HiPaymentStatusCode.DATA_NULL.rawValue{
//                onSuccess("", "", [])
//            }else{
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {})
//            }
//        }
//    }
//    
//    func paymentBill(vc:UIViewController, contractNo: String, listBill:[BillDetail], isCreateCR: Bool? = false, isRouterHTTT: Bool = false, showWarningPay: Bool = false, process: String? = nil, textType: EcounterWarningTextType = .relocation,paymentSuccess: @escaping()->Void, close: @escaping(_ isSuccess:Bool) -> Void, handleCR: @escaping() -> Void){
//        pushToPayBillVC(vc: vc, contractNo: contractNo, listBill: listBill, isCreateCR: isCreateCR, showWarningPay: showWarningPay, process: process, textType: textType ,handleResult: { (strResult) in
//            DispatchQueue.main.async {
//                PaymentOldManager.shared().presentPayResultVC(vc: vc, strUrl: strResult, handleForTokenization: { (checkIsSuccess) in
//                    if checkIsSuccess {
//                        PaymentOldManager.shared().showPopupTokenizationCard(vc: vc, title: "\(Localizable.shared.localizedString(key: "card_linked_successfully", comment: "").uppercased())!", desc: Localizable.shared.localizedString(key: "you_can_use_card_to_pay_on_Hi_FPT", comment: ""), isSuccess: checkIsSuccess)
//                    } else {
//                        PaymentOldManager.shared().showPopupTokenizationCard(vc: vc, title: "\(Localizable.shared.localizedString(key: "failed_link_card", comment: "").uppercased())!", desc: Localizable.shared.localizedString(key: "something_wrong_when_linking_card", comment: ""), isSuccess: false)
//                    }
//                }, handleBackHome: { (isSuccess) in
//                    close(isSuccess)
//                }, handleRetryPay: { isMBSCancel in
//                    self.paymentBill(vc: vc, contractNo: contractNo, listBill: listBill, isCreateCR: isCreateCR, textType: textType, paymentSuccess: paymentSuccess ,close: close, handleCR: handleCR)
//                }, handleRetryTokenization: {
//                    //MISS-CASE: Chưa biết xử lý như nào - TAIVC
//                    self.retryTokenization(vc: vc)
//                }, handleRegisterAutopay: { tokenId in
//
//                    if let contract = HiFPTPayment.shared.popupDelegate?.getCurrentContractFromMainApp(){
//                        if tokenId != 0  {
//                            PaymentOldManager.shared().createAutoPay(vc: vc, contractNo: contract.contractNo, tokenizationId: "\(tokenId)") { (msg) in
//                                print(msg)
//
//                                PaymentOldManager.shared().pushToAutopayVC(vc: vc, isHasCard: true, afterPayment: true)
//                            }
//                        } else {
//                            PaymentOldManager.shared().pushToAutopayOrAutopayDetailVC(vc: vc, contractNo: contractNo)
//                        }
//                    }
//                }, paySuccess: { isEContract in
//                    paymentSuccess()
//                })
//            }
//        }, handleFoxpayResult: { result in
//            PaymentOldManager.shared().presentToPaymentResultFoxpay(vc: vc, typeResult: .SUCCESS, isRouterHTTT: isRouterHTTT, billAmount: HiFPTPayment.shared.formatMoneyToString(amnt: result.amount), foxpayBalance: HiFPTPayment.shared.formatMoneyToString(amnt: result.balance), actionAccept: {
//                paymentSuccess()
//            }) {
//                close(true)
//            }
//            MyGlobal.shared().needReloadBalanceFoxpay = true
//        }, handleCreateCR: {
//            handleCR()
//        })
//
//    }
//    //6.2
//    func retryTokenization(vc: UIViewController){
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.createTokenization, params: PaymentOldEndPoint.paramsCreateTokenization(), signatureHeader: true, showProgressLoading: true) { (dataJson, statusResult) in
//            if(dataJson != nil){
//                
//                let mTitle = dataJson!["title"].stringValue
//                let urlRedirect = dataJson!["urlRedirect"].stringValue
//                    PaymentOldManager.shared().presentPayActionVC(vc: vc, title: mTitle, strUrl: urlRedirect, handleResult: { (strResult) in
//                        DispatchQueue.main.async {
//                            //PaymentManager.shared().presentPayResultVC(vc: self, strUrl: strResult)
//                            PaymentOldManager.shared().presentPayResultVC(vc: vc, strUrl: strResult, handleForTokenization: { (checkIsSuccess) in
//                                if checkIsSuccess {
//                                    PaymentOldManager.shared().showPopupTokenizationCard(vc: vc, title: "\(Localizable.shared.localizedString(key: "card_linked_successfully", comment: "").uppercased())!", desc: Localizable.shared.localizedString(key: "you_can_use_card_to_pay_on_Hi_FPT", comment: ""), isSuccess: checkIsSuccess)
//                                } else {
//                                    PaymentOldManager.shared().showPopupTokenizationCard(vc: vc, title: "\(Localizable.shared.localizedString(key: "failed_link_card", comment: "").uppercased())!", desc: Localizable.shared.localizedString(key: "something_wrong_when_linking_card", comment: ""), isSuccess: false)
//                                }
//                                
//                            }, handleBackHome: { isSuccess in
//                                vc.navigationController?.popToRootViewController(animated: true)
//                            }, handleRetryPay: { isMBSCancel in
//                                
//                            }, handleRetryTokenization: {
//                                self.retryTokenization(vc: vc)
//                            }, handleRegisterAutopay: { tokenId in
//                                //Hợp đồng điện tử không có luồng đk AutoPay
//                            }, paySuccess: { isEContract in
//                                //TaiVC: kiểm tra code không thấy xử lý chỗ này.
//                            })
//                        }
//                    })
//            }else{
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: statusResult.message, titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), handlerAccept: {
//                    
//                })
//            }
//            
//        }
//    }
//    
//    //v6.2.1
//    func callAPIGetFoxpayTerminalId(vc: UIViewController, contractNo:String? = nil, serviceType:String, callback: @escaping(_ ternimalId:String?)->Void) {
//        HiPaymentAPIManager.shared.callApi(endPoint: PaymentOldEndPoint.foxpayTerminalInfo, params: PaymentOldEndPoint.paramsFoxpayTerminalInfo(contractNo: contractNo, serviceType: serviceType), signatureHeader: true) { (dataJSON, result) in
//            if let data = dataJSON {
//                callback(data["terminalId"].stringValue)
//            }
//            else {
//                callback(nil)
//            }
//        }
//    }
//    
}

