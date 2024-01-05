//
//  APIManager.swift
//  HiFPTPaymentSDK
//
//  Created by GiaNH3 on 8/2/21.
//

import UIKit
import Alamofire
import SwiftyJSON

public protocol HiFPTPaymentEndPoint {
    var url: String { get }
    var errorCode: String { get }
}

public protocol HiFPTPaymentEndPointRawUrl: HiFPTPaymentEndPoint {
    var url: String { get }
    var errorCode: String { get }
}

class HiPaymentAPIManager {
    static var shared:HiPaymentAPIManager = HiPaymentAPIManager()
    
    func callApi(endPoint:HiFPTPaymentEndPoint, params:Parameters? = nil, signatureHeader: Bool, optionalHeaders:HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, handler: @escaping (JSON?, _ statusResult: HiPaymentStatusResult)->()) {
        HiFPTPayment.shared.popupDelegate?.callApi(endPoint: endPoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc, handler: handler)
    }
    
//    func getCurrentController() -> UIViewController {
//        return HiFPTPayment.shared.popupDelegate?.getCurrentController() ?? UIViewController()
//    }
}
