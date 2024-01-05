//
//  PaymentManager.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit

import SwiftyJSON
import Alamofire


class PaymentManager:NSObject {
    static var shared: PaymentManager = PaymentManager()
    
    override init() {
        super.init()
    }
    
//    func configSDK() {
//        var isProduction = false
//        if MyGlobal.shared().infoForKey("ServerEnvironment") == "Production" {
//            isProduction = true
//        }
//        
//        var allowedFoxpay = ConfigsManager.shared().configData?.isAllowFunctionApp?.foxpayPayment ?? false
//        if MyGlobal.shared().getPhoneNumber().isEmpty{
//            allowedFoxpay = false
//        }
//        
//        HiFPTPayment.shared.configSDK(delegate: self, allowMethodFoxpay: allowedFoxpay, isCustomerOfFPT: MyGlobal.shared().isCustomerOfFPT(), baseNav: HiFPTCore.shared.navigationController, isProduction: isProduction)
//        
//    }
//    
//    func pushToPaymentHistoryByDefaultContract(vc: UIViewController, callBackWebEcommerc: @escaping () -> Void ) {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.pushToPayment(vc: vc, selectTabHistory: true, callBackWebEcommerc: callBackWebEcommerc)
//    }
    
//    func pushToPaymentByDefaultContract(vc: UIViewController, isEcommercPush: Bool? = false, callBackWebEcommerc: @escaping () -> Void ) {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.pushToPayment(vc: vc, selectTabHistory: false, isEcommercPush: isEcommercPush, callBackWebEcommerc: callBackWebEcommerc)
//    }
//    
////    func pushToPayment(vc: UIViewController, selectTabHistory:Bool = false) {
////        HiFPTPayment.shared.pushToPayment(vc: vc, selectTabHistory: selectTabHistory)
////    }
//    
//    func pushToPaymentByContarctNo(vc: UIViewController, contractNo:String, billNumber: String? = nil, selectTabHistory:Bool = false) {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        for item in MyGlobal.shared().contracts{
//            if item.Contract.elementsEqual(contractNo){
//                MyGlobal.shared().currentContract = item
//                break
//            }
//        }
//        HiFPTPayment.shared.pushToPayment(vc: vc, billNumber: billNumber, selectTabHistory: selectTabHistory, callBackWebEcommerc: {})
//    }
    
//    func pushToPaymentWhenDeeplink(
//        vc: UIViewController,
//        selectTabHistory: Bool = false,
//        onSuccess: @escaping () -> Void = {}
//    ) -> Void {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        let paymentVC = UIStoryboard(name: "PaymentOld", bundle: nil).instantiateViewController(withIdentifier:"paymentOldController") as! PaymentController
//        paymentVC.callbackOnViewDidLoad = onSuccess
//        vc.pushViewControllerHiF(paymentVC, animated: true)
//    }
//    
//    func pushToPaymentCheckedBillByContarctNo(vc: UIViewController, contractNo:String, listBill: [String]) {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        for item in MyGlobal.shared().contracts{
//            if item.Contract.elementsEqual(contractNo){
//                MyGlobal.shared().currentContract = item
//                break
//            }
//        }
//        HiFPTPayment.shared.pushToPaymentCheckedBill(vc: vc, listChecked: listBill)
//    }
    
//    func paymentOrder(nav: UINavigationController, endPoint: HiFPTPaymentEndPoint, params: Parameters, orderInfo: OrderInfo,promotionCode:VoucherItemModel? = nil, referralPhone:String? = nil, serviceType: String, isRouterHDI: Bool, hasChangeFee: @escaping((_ dataJson:JSON?, _ statusResult: HiPaymentStatusResult) -> Void), paymentSuccess:@escaping(() -> Void), paymentSuccessFree:@escaping(() -> Void), close:@escaping((_ isSuccess:Bool) -> Void)) {
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.pushToPaymentMethodController(nav: nav, endPoint: endPoint, params: params, orderInfo: orderInfo, serviceType: serviceType, promotionCode:promotionCode, referralPhone: referralPhone, isRouterHDI: isRouterHDI,hasChangeFee: hasChangeFee, paymentSuccess: paymentSuccess, paymentSuccessFree: paymentSuccessFree, close: close)
//    }
//    
//    func pushToMyCardScreen(vc: UIViewController){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.pushToMyCard(vc: vc)
//    }
//    
//    func pushToPaymentBehalf(vc: UIViewController){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.pushToPaymentBehalf(vc: vc)
//    }
    
//    func getBalanceFoxpay(vc:UIViewController, onSuccess:@escaping(_ balance:Int)->Void, onFail:@escaping()->Void){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        if MyGlobal.shared().getPhoneNumber().isEmpty{
//            PopupManager.shared().showPopupContentGreyBtn(vc: vc, title: Localizable.shared.localizedString(key: "PNC_QR_ADD_PHONE_USE_FUNCTION", comment: ""), content: NSAttributedString(string: ""), titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), titleOtherButton: Localizable.shared.localizedString(key: "skip", comment: "")) {
////                HiFPTCore.shared.pushToAddPhoneAndActiveOTP{
////                    ConfigsManager.shared().retrieveDataConfig(isForceCallAPI: true) { configs in
////                        self.configSDK()
////                        self.getBalanceFoxpay(vc: vc, onSuccess: onSuccess, onFail: onFail)
////                    }
////                } onSkip: {}
//            } handlerOther: {
//                // no need
//            } handleX: {
//                // no need
//            }
//        }else{
//            HiFPTPayment.shared.getBalanceFoxpay(vc: vc, onSuccess: onSuccess, onFail: onFail)
//        }
//    }
    
//    func openFoxpaySDK(vc:UIViewController){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        if MyGlobal.shared().getPhoneNumber().isEmpty{
//            PopupManager.shared().showPopupContentGreyBtn(vc: vc, title: Localizable.shared.localizedString(key: "PNC_QR_ADD_PHONE_USE_FUNCTION", comment: ""), content: NSAttributedString(string: ""), titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), titleOtherButton: Localizable.shared.localizedString(key: "skip", comment: "")) {
////                HiFPTCore.shared.pushToAddPhoneAndActiveOTP {
////                    ConfigsManager.shared().retrieveDataConfig(isForceCallAPI: true) { configs in
////                        self.configSDK()
////                        self.openFoxpaySDK(vc: vc)
////                    }
////                } onSkip: {}
//            } handlerOther: {
//                // no need
//            } handleX: {
//                // no need
//            }
//        }else{
//            HiFPTPayment.shared.openFoxpaySDK(vc: vc)
//        }
//    }
//    
//    func logoutFoxpay(){
//        HiFPTPayment.shared.logoutFoxpay()
//    }
    
//    func checkBillByContractIdcheckBillByContractId(vc:UIViewController, contractId:String, onSuccess:@escaping(_ strTotal:String, _ function:String, _ listBill:[BillDetail]) -> Void ){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.checkBillByContractIdcheckBillByContractId(vc: vc, contractId: contractId, onSuccess: onSuccess)
//    }
//    
//    func paymentBill(vc:UIViewController, contractId: String, contractNo: String, listBill:[BillDetail], isCreateCR: Bool? = false, isRouterHTTT: Bool = false, showWarningPay: Bool = false, process: String? = nil, textType: EcounterWarningTextType = .relocation, paymentSuccess: @escaping()->Void, close: @escaping(_ isSuccess:Bool) -> Void, handleCR: @escaping() -> Void){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        var contractInfo:ContractItem?
//        for item in MyGlobal.shared().contractsActive{
//            if item.id.elementsEqual(contractId){
//                MyGlobal.shared().currentContract = item
//                contractInfo = item
//                break
//            }
//        }
//        
//        if let info = contractInfo{
//            HiFPTPayment.shared.paymentBill(vc: vc, contractNo: info.Contract, listBill: listBill, isCreateCR: isCreateCR, isRouterHTTT: isRouterHTTT, showWarningPay: showWarningPay, process: process,textType: textType, paymentSuccess: paymentSuccess, close: close, handleCR: handleCR)
//        }
//        else {
//            PaymentOldManager.shared().presentPaymentBehalfSearchVC(historyLs: [], isPresentFromHistoryList: true, contractNo: contractNo, vc: vc)
//        }
//    }
//    
//    func openFoxpayQRCode(vc:UIViewController){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        if MyGlobal.shared().getPhoneNumber().isEmpty{
//            PopupManager.shared().showPopupContentGreyBtn(vc: vc, title: Localizable.shared.localizedString(key: "PNC_QR_ADD_PHONE_USE_FUNCTION", comment: ""), content: NSAttributedString(string: ""), titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), titleOtherButton: Localizable.shared.localizedString(key: "skip", comment: "")) {
////                HiFPTCore.shared.pushToAddPhoneAndActiveOTP {
////                    ConfigsManager.shared().retrieveDataConfig(isForceCallAPI: true) { configs in
////                        self.configSDK()
////                        self.openFoxpayQRCode(vc: vc)
////                    }
////                } onSkip: {}
//            } handlerOther: {
//                // no need
//            } handleX: {
//                // no need
//            }
//        }else{
//            HiFPTPayment.shared.openFoxpayQRCode(vc: vc)
//        }
//    }
    
//    func openFoxpayBillPaymentById(vc:UIViewController, billId:Int, categoryName:String){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        if MyGlobal.shared().getPhoneNumber().isEmpty{
//            PopupManager.shared().showPopupContentGreyBtn(vc: vc, title: Localizable.shared.localizedString(key: "PNC_QR_ADD_PHONE_USE_FUNCTION", comment: ""), content: NSAttributedString(string: ""), titleAcceptButton: Localizable.shared.localizedString(key: "agree", comment: ""), titleOtherButton: Localizable.shared.localizedString(key: "skip", comment: "")) {
////                HiFPTCore.shared.pushToAddPhoneAndActiveOTP {
////                    ConfigsManager.shared().retrieveDataConfig(isForceCallAPI: true) { configs in
////                        self.configSDK()
////                        self.openFoxpayBillPaymentById(vc: vc, billId:billId, categoryName: categoryName)
////                    }
////                } onSkip: {}
//            } handlerOther: {
//                // no need
//            } handleX: {
//                // no need
//            }
//        }else{
//            HiFPTPayment.shared.openFoxpayBillPaymentById(vc: vc, billId:billId, categoryName: categoryName)
//        }
//    }
    
//    func paymentECom(nav: UINavigationController, dataJS: JSON, popMethodPay: @escaping () -> Void , paymentSuccess: @escaping (_ transId:String, _ orderId:String) -> Void, close: @escaping(_ transId:String, _ orderId:String) -> Void){
//        //Check isUpstore do nothing for apple review
//        if ConfigsManager.shared().configData?.isAllowFunctionApp?.isUpStore == true {
//            return
//        }
//        HiFPTPayment.shared.paymentECom(nav: nav, dataJS: dataJS, popMethodPay: popMethodPay, paymentSuccess: paymentSuccess, close: close)
//    }
}

//MARK: CALL API
extension PaymentManager{
    
//    func getBannerBill(vc:UIViewController, success:@escaping(_ arrBanner: [RlmBannerModel]) ->Void, error: @escaping(_ statusResult: StatusResult) ->Void ){
//        APIManager.shared.callApi(endPoint: PaymentEndPoint.bannerBill, params: nil, signatureHeader: true, optionalHeaders: nil, showProgressLoading: true, vc: vc) { json, result in
//            if result.statusCode == StatusCode.SUCCESS.rawValue {
//                var arrBanner: [RlmBannerModel] = []
//                if let json = json, let arrJson = json["banners"].array{
//                    for item in arrJson{
//                        arrBanner.append(RlmBannerModel().parseData(data: BannerModel(json: item)))
//                    }
//                }
//                PaymentNewManager.shared().bannerBills = arrBanner
//                success(arrBanner)
//            }else{
//                error(result)
//            }
//        }
//    }
//    
//    func deleteBillByContractNo(vc:UIViewController,billType:String, contractNo:String, success:@escaping()->Void){
//        let params = PaymentEndPoint.paramsDeleteBill(billType: billType, contractNo: contractNo)
//        APIManager.shared.callApi(endPoint: PaymentEndPoint.deleteBill, params: params, signatureHeader: true, optionalHeaders: nil, showProgressLoading: true, vc: vc) { json, result in
//            if result.statusCode == StatusCode.SUCCESS.rawValue {
//                var arrBanner: [BannerModel] = []
//                if let json = json, let arrJson = json["banners"].array{
//                    for item in arrJson{
//                        arrBanner.append(BannerModel(json: item))
//                    }
//                }
//                success()
//            }else{
//                PopupManager.shared().showPopup(vc: vc, title: result.message, titleAcceptButton: Localizable.shared.localizedString(key: "close"), handlerAccept: {})
//            }
//        }
//    }
}

extension PaymentManager: HiFPTPaymentPopupDelegate {
   
//    func getTotalContractFromMainApp() -> Int {
//        return MyGlobal.shared().contracts.count
//    }
//    
//    func getTotalContractActiveFromMainApp() -> Int {
//        return MyGlobal.shared().contractsActive.count
//    }
//    
    func getCurrentContractFromMainApp() -> HiPaymentContract? {
//        if let currentContract = MyGlobal.shared().currentContract{
//            return HiPaymentContract(contractNo: currentContract.Contract, contractId: currentContract.id, address: currentContract.Address, phone: currentContract.Phone, isBill: (currentContract.IsBill != 0), objectColor: currentContract.objectColor.color, informationImg: currentContract.objectColor.informationImg, img: currentContract.objectColor.img, hiFPTCustomerType: currentContract.hiFPTCustomerTypeEnum.rawValue, hiFptContractType: currentContract.hiFptContractType)
//        }
        return nil
    }
    
//    func showPopupChoiseContract(vc: UIViewController, handlerUpdate: @escaping () -> Void) {
//        CustomViewManager.shared().presentPopupManagerContract(vc: vc, handleSelect: { (contract) in
//            handlerUpdate()
//        }, handleSort: {}) {}
//    }
//    
//    
    func callApi(endPoint: HiFPTPaymentEndPoint, params: Parameters?, signatureHeader: Bool, optionalHeaders: HTTPHeaders?, showProgressLoading: Bool, vc: UIViewController?, handler: @escaping (JSON?, HiPaymentStatusResult) -> ()) {
        if let endPointKong = endPoint as? HiFPTPaymentEndPointRawUrl {
            let _endpoint = HiFPTEndpoint(rawUrl: endPointKong.url, errorCode: endPointKong.errorCode)
            
            HiFPTCore.shared.callApi(endPoint: _endpoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc) { js, res in
                let paymentResult = HiPaymentStatusResult(message: res.message, statusCode: res.statusCode)
                handler(js, paymentResult)
            }
        }
        else {
            let _endpoint = HiFPTEndpoint(endpointName: endPoint.url, errorCode: endPoint.errorCode)
            
            HiFPTCore.shared.callApi(endPoint: _endpoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc) { js, res in
                let paymentResult = HiPaymentStatusResult(message: res.message, statusCode: res.statusCode)
                handler(js, paymentResult)
            }
        }
    }
    
//    func showLoading(vc: UIViewController) {
//        HiFPTCore.shared.showLoading(vc: vc)
//    }
//    
//    func hideLoading() {
//        HiFPTCore.shared.hideLoading()
//    }
//    
//    func getCurrentController() -> UIViewController {
//        return HiFPTCore.shared.navigationController!
//    }
    
    func showPopup(vc: UIViewController, title: String, titleAcceptButton: String, handlerAccept: @escaping () -> Void) {
        //PopupManager.shared().showPopup(vc: vc, title: title, titleAcceptButton: titleAcceptButton, handlerAccept: handlerAccept)
        self.showPopupHiThemes(vc: vc, title: Localizable.shared.localizedString(key: "notification"), message: NSMutableAttributedString().customeFont(title, color: UIColor().hexStringToUIColor(hex: "#767676"), stypeFont: UIFont.systemFont(ofSize: 14.0, weight: .regular)), titleRightBtn: titleAcceptButton, actionRightButton: handlerAccept)
    }
    
    func showPopup(vc: UIViewController, title: String, content: NSAttributedString, titleAcceptButton: String, handlerAccept: @escaping () -> Void) {
        //PopupManager.shared().showPopup(vc: vc, title: title, content: content, titleAcceptButton: titleAcceptButton, handlerAccept: handlerAccept)
        self.showPopupHiThemes(vc: vc, title: title, message: NSMutableAttributedString(attributedString: content), titleRightBtn: titleAcceptButton, actionRightButton: handlerAccept)
    }
    
//    func showPopupContentWithX(vc: UIViewController, title: String, content: NSAttributedString, titleAcceptButton: String, titleOtherButton: String, handlerAccept: @escaping () -> Void, handlerOther: (() -> Void)?, handlerX: (() -> Void)?) {
//        PopupManager.shared().showPopupContent(vc: vc, title: title, content: content, titleAcceptButton: titleAcceptButton, titleOtherButton: titleOtherButton, handlerAccept: handlerAccept, handlerOther: handlerOther)
//    }
//    
    func showPopupContentGreyBtn(vc: UIViewController, title: String, content: NSAttributedString, titleAcceptButton: String, titleOtherButton: String, handlerAccept: @escaping () -> Void, handlerOther: (() -> Void)?, handleX: (() -> Void)?) {
        /// Quy hoạch popup v7.0
        //PopupManager.shared().showPopupContentGreyBtn(vc: vc, title: title, content: content, titleAcceptButton: titleAcceptButton, titleOtherButton: titleOtherButton, handlerAccept: handlerAccept, handlerOther: handlerOther, handleX: handleX)
        //HiThemesPopupManager.share().presentToPopupVC(vc: vc, type: .confirm(title: title, content: NSMutableAttributedString(attributedString: content), titleLeftBtn: titleOtherButton, titleRightBtn: titleAcceptButton, actionLeftBtn: handlerOther, actionRightBtn: handlerAccept))
        self.showPopupConfirm(vc: vc, title: title, message: NSMutableAttributedString(attributedString: content), titleLeftBtn: titleOtherButton, titleRightBtn: titleAcceptButton, actionLeftBtn: handlerOther, actionRightButton: handlerAccept, actionClose: nil)
    }
    
//    func showPopupOnlyGuest(vc: UIViewController) {
//        PopupManager.shared().showPopupOnlyGuest(vc: vc)
//    }
//    
//    func showPopupContentForGuest(vc: UIViewController, nameOfFunction: String) {
//        PopupManager.shared().showPopupContentForGuest(vc: vc, nameOfFunction: nameOfFunction)
//    }
//    
//    func popupNotificationContract(contractNo: String, contractColor: UIColor, address: String, vc: UIViewController) {
//        NotificationManager.shared().popupNotificationContract(contractNo: contractNo, contractColor: contractColor , address: address, vc: vc)
//    }
//    
//    func popupConfirmSupport(vc: UIViewController, typleOther: String, titlePopup: String, content: NSMutableAttributedString, titleOther: String, titleConfirm: String, handlerDetail: @escaping () -> Void) {
//        NotificationManager.shared().popupConfirmSupport(vc: vc, typleOther: StyleOtherButtonNoti(typleOther), titlePopup: titlePopup, content: content, titleOther: titleOther, titleConfirm: titleConfirm, handlerDetail: handlerDetail)
//    }
    
//    func popupConfirmWithAction(vc: UIViewController, typleOther: String, titlePopup: String, content: NSMutableAttributedString, titleOther: String, titleConfirm: String, handlerOther: @escaping () -> Void) {
//        NotificationManager.shared().popupConfirmWithAction(vc: vc, typleOther: StyleOtherButtonNoti(typleOther), titlePopup: titlePopup, content: content, titleOther: titleOther, titleConfirm: titleConfirm, handlerDetail: {
//            //
//        }, handlerClose: {
//            //
//        }, handlerOther: handlerOther)
//    }
//    
//    func showPopupPaymentDetail(vc: UIViewController, title: String, des: String) {
//        PopupManager.shared().showPopupPaymentDetail(vc: vc, title: title, des: des)
//    }
//    
//    func showPopupNotif(vc: UIViewController, image: UIImage, textNotif: String) {
//        PopupManager.shared().showPopupNotif(vc: vc, image: image, textNotif: textNotif)
//    }
//    
//    func checkEContractNoPopup(vc: UIViewController, contractNo:String, contractId: String) {
//        EContractManager.sharedInstance().checkEContractNoPopup(vc: vc,contractNo: contractNo, contractId: contractId)
//        
//    }
    
//    func showPopupEVC(vc: UIViewController, paymentService: PaymentService?, billNumber: String, contractNo: String, dataEVCSelected: EVoucherModel?, callBackEVC: ((EVoucherModel?) -> Void)?){
//        paymentService?.callAPIlistEVC(vc: vc, billNumber: billNumber, contractNo: contractNo, handle: { dataInfoEVC in
//            let storyBoard = UIStoryboard(name: Constants.StoryboardName.kPayment, bundle: nil)
//            let popupEVC = storyBoard.instantiateViewController(withIdentifier: Constants.StoryboardId.kEVCPopupVC) as! EVCPopupVC
//            popupEVC.modalPresentationStyle = .overCurrentContext
//            popupEVC.modalTransitionStyle = .crossDissolve
//            popupEVC.billNumber = billNumber
//            popupEVC.contractNo = contractNo
//            popupEVC.sendBackDiscount = callBackEVC
//            popupEVC.dataInfoEVC = dataInfoEVC
//            popupEVC.dataEVCSelected = dataEVCSelected
//            vc.present(popupEVC, animated: true)
//        })
//        
//    }
//    
//    func pushToPrePay(vc: UIViewController) {
//        if let contract = HiFPTPayment.shared.popupDelegate?.getCurrentContractFromMainApp(){
//            if contract.isBill == false{
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: Localizable.shared.localizedString(key: "feature_for_internet_tv", comment: ""), titleAcceptButton: Localizable.shared.localizedString(key: "close", comment: ""), handlerAccept: {
//                })
//            }else{
//                PrePaidManager.shared().checkPrePaid(vc: vc, contractId: contract.contractId) { (prePaid) in
//                    let vm = PrepaidVM.init(prepaid: prePaid)
//                    switch prePaid.function {
//                    case "create-request":
//                        PrePaidManager.shared().pushToRegisterPrepaidVC(vc: vc, prepaidVM: vm, isQuotation: false, handler: { isSuccess,listBill in
//                            if isSuccess{
//                                //self.listChecked = listBill
//                            }
//                        })
//                        break
//                    case "history":
//                        PrePaidManager.shared().pushToHistoryPrepaidVC(vc: vc, prepaidVM: vm, canRegister: false)
//                        break
//                    case "price-quotation":
//                        if (vm.defaultChecked?.month.count)! > 0 {
//                            PrePaidManager.shared().pushToPriceQuotationVC(vc: vc, prepaidVM: vm, handler: { isSuccess,listBill in
//                                if isSuccess{
//                                    //self.listChecked = listBill
//                                }
//                            })
//                        } else {
//                            PrePaidManager.shared().pushToRegisterPrepaidVC(vc: vc, prepaidVM: vm, isQuotation: true, handler: { isSuccess,listBill in
//                                if isSuccess{
//                                    //self.listChecked = listBill
//                                }
//                            })
//                        }
//                        break
//                    case "price-quotation-history":
//                        if (vm.defaultChecked?.month.count)! > 0 {
//                            PrePaidManager.shared().pushToPriceQuotationVC(vc: vc, prepaidVM: vm, handler: { isSuccess,listBill in
//                                if isSuccess{
//                                    //self.listChecked = listBill
//                                }
//                            })
//                        } else {
//                            PrePaidManager.shared().pushToHistoryPrepaidVC(vc: vc, prepaidVM: vm, canRegister: true)
//                        }
//                        
//                        break
//                    default:
//                        break
//                    }
//                }
//            }
//        }else{
//            HiFPTPayment.shared.popupDelegate?.showPopupContentForGuest(vc: vc, nameOfFunction: Localizable.shared.localizedString(key: "content_off_pre_pay", comment: ""))
//        }
//    }
//    
//    func pushToMyCard(vc: UIViewController) {
//        PaymentOldManager.shared().pushToMyCardVC(vc: vc)
//    }
//    
//    func pushToAutoPayVC(vc: UIViewController) {
//        if let contract = HiFPTPayment.shared.popupDelegate?.getCurrentContractFromMainApp(){
//            if contract.isBill == false {
//                HiFPTPayment.shared.popupDelegate?.showPopup(vc: vc, title: Localizable.shared.localizedString(key: "feature_for_internet_tv", comment: ""), titleAcceptButton: Localizable.shared.localizedString(key: "close", comment: ""), handlerAccept: {
//                })
//            }else {
//                PaymentOldManager.shared().pushToAutopayOrAutopayDetailVC(vc: vc, contractNo: contract.contractNo)
//            }
//        }else{
//            HiFPTPayment.shared.popupDelegate?.showPopupContentForGuest(vc: vc, nameOfFunction: Localizable.shared.localizedString(key: "content_off_auto_pay", comment: ""))
//        }
//    }
//    
//    
//    func pushToPaymentBehalfNew(vc: UIViewController) {
//        if HiFPTPayment.shared.popupDelegate?.getCurrentContractFromMainApp() == nil{
//            HiFPTPayment.shared.popupDelegate?.popupConfirmWithAction(vc: vc, typleOther: "OrangeTextNotBackground", titlePopup: Localizable.shared.localizedString(key: "popup_guest_title", comment: ""), content: guestPopupPayBehalfAttributedText(), titleOther: Localizable.shared.localizedString(key: "search_for_contract_number", comment: ""), titleConfirm: Localizable.shared.localizedString(key: "login", comment: "")) {
//                // other btn
//                PaymentOldManager.shared().pushToPaymentBehalfVC(isPushFromSearchHome: true, vc: vc)
//            }
//        }
//        else {
//            PaymentOldManager.shared().pushToPaymentBehalfVC(vc: vc)
//        }
//    }
//    
//    private func guestPopupPayBehalfAttributedText() -> NSMutableAttributedString {
//        let currentString:String = Localizable.shared.localizedString(key: "pay_behalf_guest_popup_string", comment: "")
//        let attributedString = NSMutableAttributedString(string: currentString,
//                                                         attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor(red:0.4, green:0.4, blue:0.4, alpha:1)])
//        let range = (currentString as NSString).range(of: "19006600")
//        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor(red:0.27, green:0.39, blue:0.93, alpha:1)]
//        attributedString.addAttributes(boldFontAttribute, range: range)
//        
//        
//        let boldFontAttribute2: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor(red:0.4, green:0.4, blue:0.4, alpha:1)]
//        let range2 = (currentString as NSString).range(of: "“\(Localizable.shared.localizedString(key: "pay_behalf_guest_find_contract", comment: ""))”")
//        attributedString.addAttributes(boldFontAttribute2, range: range2)
//        
//        return attributedString
//    }
    
    func showPopupConfirm(vc : UIViewController,
                          title: String,
                          message: NSMutableAttributedString,
                          titleLeftBtn : String,
                          titleRightBtn : String,
                          actionLeftBtn: (()->Void)?,
                          actionRightButton: (()->Void)?,
                          actionClose: (()->Void)?){
        
        let type = HiThemesPopupType.confirm(title: title,
                                             content: message,
                                             titleLeftBtn: titleLeftBtn,
                                             titleRightBtn: titleRightBtn,
                                             actionLeftBtn: actionLeftBtn,
                                             actionRightBtn: actionRightButton)
        HiThemesPopupManager.share().presentToPopupVC(vc: vc, type: type, actionClose: actionClose)
    }
    
    func showPopupHiThemes(vc : UIViewController,
                          title: String,
                          message: NSMutableAttributedString,
                          titleRightBtn : String,
                          actionRightButton: (()->Void)?){
        
        let type = HiThemesPopupType.alert(title: title,
                                           content: message,
                                           titleRightBtn: titleRightBtn,
                                           actionRightBtn: actionRightButton)
        
        HiThemesPopupManager.share().presentToPopupVC(vc: vc, type: type)
    }
}
