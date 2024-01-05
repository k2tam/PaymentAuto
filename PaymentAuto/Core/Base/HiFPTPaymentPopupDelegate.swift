//
//  HiFPTPaymentPopupDelegate.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit
import SwiftyJSON
import Alamofire

public protocol HiFPTPaymentPopupDelegate: NSObject {
    func callApi(endPoint:HiFPTPaymentEndPoint, params:Parameters?, signatureHeader: Bool, optionalHeaders:HTTPHeaders?, showProgressLoading:Bool, vc:UIViewController?, handler: @escaping (JSON?, _ statusResult: HiPaymentStatusResult)->())
//    func showLoading(vc: UIViewController)
//    func hideLoading()
//    func getCurrentController() -> UIViewController
    func showPopup(vc: UIViewController, title: String, titleAcceptButton: String, handlerAccept: @escaping()->Void)
    func showPopup(vc: UIViewController, title: String, content: NSAttributedString, titleAcceptButton: String, handlerAccept: @escaping()->Void)
//    func showPopupContentWithX(vc: UIViewController, title: String, content: NSAttributedString, titleAcceptButton: String, titleOtherButton: String, handlerAccept: @escaping()->Void, handlerOther: (() -> Void)?, handlerX: (() -> Void)?)
    func showPopupContentGreyBtn(vc: UIViewController, title: String, content: NSAttributedString, titleAcceptButton: String, titleOtherButton: String, handlerAccept: @escaping()->Void, handlerOther: (() -> Void)?, handleX: (() -> Void)?)
//    func showPopupOnlyGuest(vc: UIViewController)
//    func showPopupContentForGuest(vc: UIViewController, nameOfFunction: String)
//    func popupNotificationContract(contractNo: String, contractColor: UIColor, address: String, vc: UIViewController)
//    func popupConfirmSupport(vc: UIViewController, typleOther: String, titlePopup: String, content: NSMutableAttributedString, titleOther: String, titleConfirm: String, handlerDetail: @escaping()->Void)
//    func popupConfirmWithAction(vc: UIViewController, typleOther: String, titlePopup: String, content: NSMutableAttributedString, titleOther: String, titleConfirm: String, handlerOther: @escaping()->Void)
//    func showPopupPaymentDetail(vc: UIViewController, title: String, des: String)
//    func showPopupNotif(vc: UIViewController, image: UIImage, textNotif: String)
//    func checkEContractNoPopup(vc: UIViewController, contractNo:String, contractId: String)
//    func showPopupChoiseContract(vc: UIViewController, handlerUpdate:@escaping()->Void)
    func getCurrentContractFromMainApp() -> HiPaymentContract?
//    func getTotalContractFromMainApp() -> Int
//    func getTotalContractActiveFromMainApp() -> Int
}

