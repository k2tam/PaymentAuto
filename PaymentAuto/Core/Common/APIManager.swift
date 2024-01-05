//
//  APIManager.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit
import Alamofire
import SwiftyJSON
import OSLog

class APIManager {
    //    let rootQueue = DispatchQueue(label: "rad.ftel.hi-fpt.ss.alamofire.rootQueue")
    static var interceptor = HiFRequestInterceptor(tokenKeyChain: nil)
    static let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = HiFPTCore.shared.timeOutInterval
        
        return Session(configuration: configuration)
    }()
    static func logResponseForDebug(_ endPoint: HiFPTEndpoint, fail error: Error) {
        let message = """
        --- Response info ---
        ENDPOINT: \(endPoint.url.absoluteString)
        ERROR: \(error)
        ---------------------
        """
        HiFPTLogger.log(type: .debug, category: .apiService, message: message)
    }
    static func callApi(endPoint:HiFPTEndpoint, params:Parameters? = nil, signatureHeader:Bool, optionalHeaders:HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->(), acceptCompletion: (() -> Void)? = nil, cancelCompletion: (() -> Void)? = nil) {
        requestAPI(endPoint: endPoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc, rawResult: false, isShowPopupError: false, acceptCompletion: acceptCompletion, cancelCompletion: cancelCompletion) { js, stt in
            handler(js, stt)
        }
    }
    
    /// Return raw json api return in handler
    /// - Parameters:
    ///   - isShowPopupError: if isShowPopupError == false -> HiCore will show popup
    ///   - errorCompletion: called when HiCore showPopup
    static func callApiWithRawResult(endPoint:HiFPTEndpoint, params:Parameters? = nil, signatureHeader:Bool, optionalHeaders:HTTPHeaders? = nil, showProgressLoading:Bool = true, methodHTTP: HTTPMethod = .post, vc:UIViewController? = nil, isShowPopupError: Bool = false, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->(), errorCompletion: ((_ statusResult: Int)->())? = nil) {
        requestAPI(endPoint: endPoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc, rawResult: true, isShowPopupError: isShowPopupError, methodHTTP: methodHTTP, errorCompletion: errorCompletion) { js, stt in
            handler(js, stt)
        }
    }
    
    static func callApiWithStatusCode(endPoint:HiFPTEndpoint, params:Parameters? = nil, signatureHeader:Bool, optionalHeaders:HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->()) {
        requestAPI(endPoint: endPoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc, rawResult: false, isShowPopupError: true) { js, stt in
            handler(js, stt)
        }
    }
    
    static func callApiWithResponse(endPoint:HiFPTEndpoint, params:Parameters? = nil, signatureHeader:Bool, optionalHeaders:HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->()) {
        requestAPI(endPoint: endPoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, showProgressLoading: showProgressLoading, vc: vc, rawResult: false, isShowPopupError: true) { js, stt in
            handler(js, stt)
        }
    }
    
//    static func callApiBackground(endPoint: HiFPTEndpoint, params: Parameters? = nil, signatureHeader: Bool, optionalHeaders: HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, rawResult: Bool, isShowPopupError: Bool = true, methodHTTP: HTTPMethod = .post, acceptCompletion: @escaping () -> Void = {}, cancelCompletion: (() -> Void)? = nil, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->()){
//        requestAPIBackground(endPoint: endPoint, params: params, signatureHeader: signatureHeader, optionalHeaders: optionalHeaders, vc: vc, rawResult: rawResult, isShowPopupError: isShowPopupError, methodHTTP: methodHTTP, acceptCompletion: acceptCompletion, cancelCompletion: cancelCompletion, handler: handler)
//    }
    
    
    /// Main func request api
    /// - Parameters:
    ///   - isShowPopupError: if isShowPopupError == false -> HiCore will show popup
    ///   - errorCompletion: called when HiCore showPopup
    static func requestAPI(
        endPoint: HiFPTEndpoint,
        params: Parameters? = nil,
        signatureHeader: Bool,
        optionalHeaders: HTTPHeaders? = nil,
        showProgressLoading: Bool = true,
        vc: UIViewController? = nil,
        rawResult: Bool,
        isShowPopupError: Bool = false,
        methodHTTP: HTTPMethod = .post,
        errorCompletion: ((_ statusResult: Int)->())? = nil,
        acceptCompletion: (() -> Void)? = nil,
        cancelCompletion: (() -> Void)? = nil,
        handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->()
    ) {
        let language = HiFPTCore.shared.language.rawValue
        var mHeaders:HTTPHeaders = ["lang": language]
        if optionalHeaders != nil {
            optionalHeaders?.forEach({ item in
                mHeaders.add(item)
            })
        }
//        logRequestForDebug(endPoint, mHeaders, params)
        
//        DispatchQueue.main.async {
//            if let viewController = vc, showProgressLoading {
//                HiFPTCore.shared.showLoading(vc: viewController)
//            }
//            else if showProgressLoading {
//                let navVC = HiFPTCore.shared.navigationController
//                if let vc = navVC {
//                    HiFPTCore.shared.showLoading(vc: vc)
//                }
//            }
//        }
        
        // start call api tracking event
        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
        
        let _session = signatureHeader ? sessionManager : AF
        _session.request(endPoint.url, method: methodHTTP, parameters: params, encoding: JSONEncoding.default, headers: mHeaders, interceptor: signatureHeader ? interceptor : nil).customValidate().response { (data) in
//            DispatchQueue.main.async {
//                if showProgressLoading {
//                    HiFPTCore.shared.hideLoading()
//                }
//            }
            
            // end call api tracking event
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
            
            switch data.result {
            case .success(let json):
                let result = JSON(json as Any)
              
                
                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
                if(result["statusCode"].null != NSNull()){
                    stCode = result["statusCode"].intValue
                }
                
                var dataJson:JSON? = nil
                if result["data"].null != NSNull() && !rawResult {
                    dataJson = JSON(result["data"])
                }
                else if rawResult {
                    dataJson = result
                }
                            
                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
                
                // send code tracking
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: params)
                
                switch stCode {
                case HiFPTStatusCode.SUCCESS.rawValue:
                    handler(dataJson, statusResult)
                case HiFPTStatusCode.CLIENT_ERROR.rawValue:
                    print("CLIENT_ERROR: Not found statusCode")
                    if isShowPopupError {
                        let statusResult = HiFPTStatusResult(message: "CLIENT_ERROR: Not found statusCode", statusCode: stCode)
                        handler(nil, statusResult)
                    } else {
                        DispatchQueue.main.async {
//                            PopupManager.showPopup(content: Localizable.sharedInstance().localizedString(key: "please_try_again_later"), acceptTitle: Localizable.sharedInstance().localizedString(key: "agree", comment: "")) {
//                            }
                        }
                        errorCompletion?(statusResult.statusCode)
                    }
                default:
                    handler(dataJson, statusResult)
                }
                break
            case .failure(let error):
                logResponseForDebug(endPoint, fail: error)
//                trackingNetworkError(vc: vc, endPoint: endPoint, params: params, netError: error)
                if isShowPopupError {
                    let statusResult = HiFPTStatusResult(message: error.localizedDescription, statusCode: error._code)
                    handler(nil, statusResult)
                }
                else if error._code == NSURLErrorTimedOut {
                    let statusResult = HiFPTStatusResult(message: error.localizedDescription, statusCode: -2)
                    handler(nil, statusResult)
                } else if (error._code == 13) {
                    DispatchQueue.main.async {
                       // showTimeOut(vc: vc, "\(endPoint.errorCode ?? "")_\(-3)", acceptCompletion: acceptCompletion, cancelCompletion: cancelCompletion)
                    
                    }
                    errorCompletion?(error._code)
                }
                else {
                    DispatchQueue.main.async {
                        //showLostInternet(vc: vc, "\(endPoint.errorCode ?? "")_\(error._code)", acceptCompletion: acceptCompletion, cancelCompletion: cancelCompletion)
                    }
                    errorCompletion?(error._code)
                }
            }
        }
    }


//    static func requestAPIreturnAllResult(endPoint: HiFPTEndpoint, params:Parameters? = nil, methodHTTP: HTTPMethod = .post, signatureHeader:Bool, optionalHeaders:HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, handler: @escaping (JSON?, AFError?)->()){
//        
//        let language = HiFPTCore.shared.language.rawValue
//        var mHeaders:HTTPHeaders = ["lang": language]
//        if optionalHeaders != nil {
//            optionalHeaders?.forEach({ item in
//                mHeaders.add(item)
//            })
//        }
//        
//        logRequestForDebug(endPoint, mHeaders, params)
//        
//        DispatchQueue.main.async {
//            if let viewController = vc, showProgressLoading {
//                HiFPTCore.shared.showLoading(vc: viewController)
//            }
//            else if showProgressLoading {
//                let navVC = HiFPTCore.shared.navigationController
//                if let vc = navVC {
//                    HiFPTCore.shared.showLoading(vc: vc)
//                }
//            }
//        }
//        
//        // start call api tracking event
//        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//        
//        let _session = signatureHeader ? sessionManager : AF
//        _session.request(endPoint.url, method: methodHTTP, parameters: params, encoding: JSONEncoding.default, headers: mHeaders, interceptor: signatureHeader ? interceptor : nil).customValidate().response { (data) in
//            DispatchQueue.main.async {
//                if showProgressLoading {
//                    HiFPTCore.shared.hideLoading()
//                }
//            }
//            
//            // end call api tracking event
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//            
//            switch data.result {
//            case .success(let json):
//                let result = JSON(json as Any)
//                logResponseForDebug(endPoint, success: result)
//                
//                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
//                if(result["statusCode"].null != NSNull()){
//                    stCode = result["statusCode"].intValue
//                }
//                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
//                
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: params)
//                handler(JSON(json ?? Any.self),nil)
//            case .failure(let error):
//                logResponseForDebug(endPoint, fail: error)
//                trackingNetworkError(vc: vc, endPoint: endPoint, params: params, netError: error)
//                handler(nil, error)
//            }
//        }
//        
//    }
//    
//    /// Gọi api handle tất cả status code
//    /// - Parameters:
//    ///   - afFailureHandler: khi AF result = .failure
//    ///   - afSuccessCompletion: khi AF result = .success và không có lỗi API HiCore Handle
//    static func requestAPIWithAFHandler(
//        endPoint:HiFPTEndpoint,
//        params:Parameters? = nil,
//        signatureHeader:Bool,
//        optionalHeaders:HTTPHeaders? = nil,
//        showProgressLoading:Bool = true,
//        vc:UIViewController? = nil,
//        isShowPopupError: Bool = false,
//        methodHTTP: HTTPMethod = .post,
//        afFailureHandler: @escaping (_ statusResult: HiFPTStatusResult) -> Void = {_ in },
//        afSuccessHandler: @escaping (_ resultJS: JSON?, _ statusResult: HiFPTStatusResult) -> Void
//    ) {
//        let language = HiFPTCore.shared.language.rawValue
//        var mHeaders:HTTPHeaders = ["lang": language]
//        if optionalHeaders != nil {
//            optionalHeaders?.forEach({ item in
//                mHeaders.add(item)
//            })
//        }
//        
//        logRequestForDebug(endPoint, mHeaders, params)
//        
//        DispatchQueue.main.async {
//            if let viewController = vc, showProgressLoading {
//                HiFPTCore.shared.showLoading(vc: viewController)
//            }
//            else if showProgressLoading {
//                let navVC = HiFPTCore.shared.navigationController
//                if let vc = navVC {
//                    HiFPTCore.shared.showLoading(vc: vc)
//                }
//            }
//        }
//        
//        // start call api tracking event
//        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//        
//        let _session = signatureHeader ? sessionManager : AF
//        _session.request(endPoint.url, method: methodHTTP, parameters: params, encoding: JSONEncoding.default, headers: mHeaders, interceptor: signatureHeader ? interceptor : nil).customValidate().response { (data) in
//            DispatchQueue.main.async {
//                if showProgressLoading {
//                    HiFPTCore.shared.hideLoading()
//                }
//            }
//            
//            // end call api tracking event
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//            
//            switch data.result {
//            case .success(let json):
//                let result = JSON(json as Any)
//                logResponseForDebug(endPoint, success: result)
//                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
//                if(result["statusCode"].null != NSNull()){
//                    stCode = result["statusCode"].intValue
//                }
//                
//                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
//                
//                // send code tracking
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: params)
//                
//                switch stCode {
//                case HiFPTStatusCode.SUCCESS.rawValue:
//                    afSuccessHandler(result, statusResult)
//                case HiFPTStatusCode.CLIENT_ERROR.rawValue:
//                    print("CLIENT_ERROR: Not found statusCode")
//                    afSuccessHandler(result, statusResult)
//                default:
//                    afSuccessHandler(result, statusResult)
//                    break
//                }
//                break
//            case .failure(let error):
//                logResponseForDebug(endPoint, fail: error)
//                if error._code == NSURLErrorTimedOut {
//                    let statusResult = HiFPTStatusResult(message: error.localizedDescription, statusCode: -2)
//                    afFailureHandler(statusResult)
//                } else if (error._code == 13) {
//                    // timeout
//                    let statusResult = HiFPTStatusResult(message: getNetworkErrorMessage("\(endPoint.errorCode ?? "")_\(-3)"), statusCode: -3)
//                    afFailureHandler(statusResult)
//                }
//                else {
//                    //other error
//                    let statusResult = HiFPTStatusResult(message: getNetworkErrorMessage("\(endPoint.errorCode ?? "")_\(error._code)"), statusCode: error._code)
//                    afFailureHandler(statusResult)
//                }
//            }
//        }
//    }
//    
//    static func requestAPIBackground(endPoint: HiFPTEndpoint, params: Parameters? = nil, signatureHeader: Bool, optionalHeaders: HTTPHeaders? = nil, showProgressLoading:Bool = true, vc:UIViewController? = nil, rawResult: Bool, isShowPopupError: Bool = true, methodHTTP: HTTPMethod = .post, acceptCompletion: @escaping () -> Void = {}, cancelCompletion: (() -> Void)? = nil, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->()) {
//        let language = HiFPTCore.shared.language.rawValue
//        var mHeaders:HTTPHeaders = ["lang": language]
//        if optionalHeaders != nil {
//            optionalHeaders?.forEach({ item in
//                mHeaders.add(item)
//            })
//        }
//        
//        logRequestForDebug(endPoint, mHeaders, params)
//        
//        if interceptor.getTokenKeyChain() == nil{
//            let storage = StorageKeyChain<TokenKeychain>()
//            interceptor.setTokenKeyChain(tokenKeyChain: storage.getKeychainData())
//        }
//        
//        // start call api tracking event
//        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//        
//        let _session = signatureHeader ? sessionManager : AF
//        _session.request(endPoint.url, method: methodHTTP, parameters: params, encoding: JSONEncoding.default, headers: mHeaders, interceptor: signatureHeader ? interceptor : nil).customValidate().response { (data) in
//            
//            // end call api tracking event
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//            
//            switch data.result {
//            case .success(let json):
//                let result = JSON(json as Any)
//                logResponseForDebug(endPoint, success: result)
//                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
//                if(result["statusCode"].null != NSNull()){
//                    stCode = result["statusCode"].intValue
//                }
//                
//                var dataJson:JSON? = nil
//                if result["data"].null != NSNull() && !rawResult {
//                    dataJson = JSON(result["data"])
//                }
//                else if rawResult {
//                    dataJson = result
//                }
//                
//                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: params)
//                switch stCode {
//                case HiFPTStatusCode.SUCCESS.rawValue:
//                    handler(dataJson, statusResult)
//                case HiFPTStatusCode.CLIENT_ERROR.rawValue:
//                    print("CLIENT_ERROR: Not found statusCode")
//                    if isShowPopupError{
//                        DispatchQueue.main.async {
//                            PopupManager.showPopup(content: Localizable.sharedInstance().localizedString(key: "please_try_again_later"), acceptTitle: Localizable.sharedInstance().localizedString(key: "agree", comment: ""), acceptCompletion: acceptCompletion)
//                        }
//                    }
//                    else
//                    {
//                        handler(dataJson, statusResult)
//                    }
//                    break
//                default:
//                    handler(dataJson, statusResult)
//                    break
//                }
//                
//                break
//            case .failure(let error):
//                trackingNetworkError(vc: vc, endPoint: endPoint, params: params, netError: error)
//                logResponseForDebug(endPoint, fail: error)
//                if !isShowPopupError {
//                    let statusResult = HiFPTStatusResult(message: error.localizedDescription, statusCode: error._code)
//                    handler(nil, statusResult)
//                }
//                else if error._code == NSURLErrorTimedOut {
//                    let statusResult = HiFPTStatusResult(message: error.localizedDescription, statusCode: -2)
//                    handler(nil, statusResult)
//                } else if (error._code == 13) {
//                    DispatchQueue.main.async {
//                        showTimeOut(vc: vc, "\(endPoint.errorCode ?? "")_\(-3)", acceptCompletion: acceptCompletion, cancelCompletion: cancelCompletion)
//                    
//                    }
//                }
//                else {
//                    DispatchQueue.main.async {
//                        showLostInternet(vc: vc, "\(endPoint.errorCode ?? "")_\(error._code)", acceptCompletion: acceptCompletion, cancelCompletion: cancelCompletion)
//                    }
//                }
//            }
//        }
//
//    }
//    
//    //UPLOAD không cần định nghĩa key cho fileUPLOAD
//    static func callAPIupLoadDataMedia(data: Data, endPoint: HiFPTEndpoint, methodHTTP: HTTPMethod = .post, signatureHeader:Bool, showProgressLoading: Bool = true, vc: UIViewController? = nil, handler: @escaping (JSON)->()){
//        
//        HiFPTLogger.log(type: .debug, category: .apiService, message: "ENDPOINT: \(endPoint.url.absoluteString)")
//        
//        DispatchQueue.main.async {
//            if let viewController = vc, showProgressLoading {
//                HiFPTCore.shared.showLoading(vc: viewController)
//            }
//            else if showProgressLoading {
//                let navVC = HiFPTCore.shared.navigationController
//                if let vc = navVC {
//                    HiFPTCore.shared.showLoading(vc: vc)
//                }
//            }
//        }
//        
//        // start call api tracking event
//        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: [:], uuid: uuidStr))
//        
//        let _session = signatureHeader ? sessionManager : AF
//        _session.upload(data, to: endPoint.url, method: methodHTTP).customValidate().response{ (data) in
//            DispatchQueue.main.async {
//                if showProgressLoading {
//                    HiFPTCore.shared.hideLoading()
//                }
//            }
//            
//            // end call api tracking event
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: [:], uuid: uuidStr))
//            
//            switch data.result{
//            case .success(let json):
//                let result = JSON(json as Any)
//                logResponseForDebug(endPoint, success: result)
//                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
//                if(result["statusCode"].null != NSNull()){
//                    stCode = result["statusCode"].intValue
//                }
//                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: nil)
//            case .failure(let error):
//                logResponseForDebug(endPoint, fail: error)
//                trackingNetworkError(vc: vc, endPoint: endPoint, params: nil, netError: error)
//            }
//            handler(JSON(data.result))
//        }
//    }
//    
//    //DOWNLOAD không cần định nghĩa key cho fileDOWNLOAD
//    static func callAPIdownLoadDataMedia(endPoint: HiFPTEndpoint, methodHTTP: HTTPMethod = .post, signatureHeader:Bool, showProgressLoading: Bool = true, vc: UIViewController? = nil, handler: @escaping (JSON)->()){
//        HiFPTLogger.log(type: .debug, category: .apiService, message: "ENDPOINT: \(endPoint.url.absoluteString)")
//        DispatchQueue.main.async {
//            if let viewController = vc, showProgressLoading {
//                HiFPTCore.shared.showLoading(vc: viewController)
//            }
//            else if showProgressLoading {
//                let navVC = HiFPTCore.shared.navigationController
//                if let vc = navVC {
//                    HiFPTCore.shared.showLoading(vc: vc)
//                }
//            }
//        }
//        
//        // start call api tracking event
//        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: [:], uuid: uuidStr))
//        
//        let _session = signatureHeader ? sessionManager : AF
//        _session.download(endPoint.url, method: methodHTTP).validate().response{ (data) in
//            DispatchQueue.main.async {
//                if showProgressLoading {
//                    HiFPTCore.shared.hideLoading()
//                }
//            }
//            
//            // end call api tracking event
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: [:], uuid: uuidStr))
//            
//            switch data.result{
//            case .success(let json):
//                let result = JSON(json as Any)
//                logResponseForDebug(endPoint, success: result)
//                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
//                if(result["statusCode"].null != NSNull()){
//                    stCode = result["statusCode"].intValue
//                }
//                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: nil)
//            case .failure(let error):
//                logResponseForDebug(endPoint, fail: error)
//                trackingNetworkError(vc: vc, endPoint: endPoint, params: nil, netError: error)
//            }
//            handler(JSON(data.result))
//        }
//    }
//    
//    //UPLOAD phải định nghĩa key cho fileUp
//    static func callApiUploadFormData(data: Data, dataName: String, fileName: String?, mimeType:String?, endPoint:HiFPTEndpoint, params:Parameters? = nil, signatureHeader:Bool, showProgressLoading:Bool = true, vc:UIViewController? = nil, handlerUploading: ((_ percent: Double) -> Void)?, handlerDownloading: ((_ percent: Double) -> Void)?, handler: @escaping (JSON?, _ statusResult: HiFPTStatusResult)->()) {
//        
//        logRequestForDebug(endPoint, HTTPHeaders(), params)
//        HiFPTLogger.log(type: .debug, category: .apiService, message: "ENDPOINT: \(endPoint.url.absoluteString)")
//        let requestJSON: String = (params ?? [:]).getStringJsonFromDic() ?? ""
//        HiFPTLogger.log(type: .debug, category: .apiService, message: "BODY: \(requestJSON)")
//        
//        DispatchQueue.main.async {
//            if let viewController = vc, showProgressLoading {
//                HiFPTCore.shared.showLoading(vc: viewController)
//            }
//            else if showProgressLoading {
//                let navVC = HiFPTCore.shared.navigationController
//                if let vc = navVC {
//                    HiFPTCore.shared.showLoading(vc: vc)
//                }
//            }
//        }
//        
//        // start call api tracking event
//        let uuidStr = UUID().uuidString
//        HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .startCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//        
//        let _session:Session = signatureHeader ? sessionManager : AF
//        _session.upload(multipartFormData: { multiData in
//            multiData.append(data, withName: dataName, fileName: fileName, mimeType: mimeType)
//            if let parameters = params {
//                for (key, value) in parameters {
//                    multiData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue) ?? Data(), withName: key)
//                }
//            }
//        }, to: endPoint.url, method: .post, interceptor: signatureHeader ? interceptor : nil)
//        .uploadProgress { progress in
//            handlerUploading?(progress.fractionCompleted)
//        }
//        .downloadProgress { progress in
//            handlerDownloading?(progress.fractionCompleted)
//        }
//        .response { dataResponse in
//            DispatchQueue.main.async {
//                if showProgressLoading {
//                    HiFPTCore.shared.hideLoading()
//                }
//            }
//            
//            // end call api tracking event
//            let uuidStr = UUID().uuidString
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .endCallApi(endPoint.url.absoluteString, params: params, uuid: uuidStr))
//            
//            switch dataResponse.result {
//            case .success(let json):
//                let result = JSON(json as Any)
//                logResponseForDebug(endPoint, success: result)
//                var stCode = HiFPTStatusCode.CLIENT_ERROR.rawValue
//                if(result["statusCode"].null != NSNull()){
//                    stCode = result["statusCode"].intValue
//                }
//                
//                var dataJson:JSON? = nil
//                if result["data"].null != NSNull() {
//                    dataJson = JSON(result["data"])
//                }
//                
//                let statusResult = HiFPTStatusResult(message: result["message"].stringValue, statusCode: stCode)
//                trackingAPIError(vc: vc, statusResult: statusResult, endPoint: endPoint, params: params)
//                switch stCode {
//                case HiFPTStatusCode.SUCCESS.rawValue:
//                    handler(dataJson, statusResult)
//                default:
//                    handler(dataJson, statusResult)
//                }
//                break
//            case .failure(let error):
//                trackingNetworkError(vc: vc, endPoint: endPoint, params: params, netError: error)
//                logResponseForDebug(endPoint, fail: error)
//                if error._code == NSURLErrorTimedOut {
//                    let statusResult = HiFPTStatusResult(message: error.localizedDescription, statusCode: -2)
//                    handler(nil, statusResult)
//                } else if (error._code == 13) {
//                    showTimeOut(vc: vc, "\(endPoint.errorCode ?? "")_\(-3)")
//                }
//                else {
//                    showLostInternet(vc: vc, "\(endPoint.errorCode ?? "")_\(error._code)")
//                }
//            }
//        }
//    }
//    
//    static func checkInternet() -> Bool {
//        return NetworkReachabilityManager()?.isReachable ?? false
//    }
//    
//    static func showLostInternet(
//        vc: UIViewController?,
//        _ errorHiFPT: String? = nil,
//        acceptCompletion: (() -> Void)? = nil,
//        cancelCompletion: (() -> Void)? = nil,
//        closeCompletion: @escaping () -> Void = {}
//    ){
//        let (strTitle, attrTextCotent) = getSystemErrorAttributeString(errorHiFPT)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//            if let vc = vc {
//                PopupManager.showAlert(
//                    vc: vc,
//                    title: strTitle,
//                    attrContent: attrTextCotent,
//                    acceptTitle: Localizable.sharedInstance().localizedString(key: "close"),
//                    acceptCompletion: acceptCompletion ?? {},
//                    cancelCompletion: cancelCompletion ?? {},
//                    closeCompletion: closeCompletion
//                )
//            }
//            else {
//                PopupManager.showAlert(
//                    title: strTitle,
//                    attrContent: attrTextCotent,
//                    acceptTitle: Localizable.sharedInstance().localizedString(key: "close"),
//                    acceptCompletion: acceptCompletion ?? {}, cancelCompletion: cancelCompletion ?? {},
//                    closeCompletion: closeCompletion)
//            }
//        })
//    }
//    
//    static func showTimeOut(vc: UIViewController?, _ errorHiFPT: String? = nil, acceptCompletion: (() -> Void)? = nil, cancelCompletion: (() -> Void)? = nil){
//        let (strTitle, attrTextCotent) = getSystemErrorAttributeString(errorHiFPT)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//            guard let safeVC = vc else {
//                PopupManager.showAlert(
//                    title: strTitle,
//                    attrContent: attrTextCotent,
//                    acceptTitle: Localizable.sharedInstance().localizedString(key: "close"),
//                    acceptCompletion: acceptCompletion ?? {}, cancelCompletion: cancelCompletion ?? {})
//                return
//            }
//            PopupManager.showAlert(
//                vc: safeVC,
//                title: strTitle,
//                attrContent: attrTextCotent,
//                acceptTitle: Localizable.sharedInstance().localizedString(key: "close"),
//                acceptCompletion: acceptCompletion ?? {}, cancelCompletion: cancelCompletion ?? {})
//        })
//    }
//    
//    static func getSystemErrorAttributeString(_ errorHiFPT: String? = nil) -> (String, NSMutableAttributedString) {
//        var strTitle = String()
//        var attrTextCotent = NSMutableAttributedString()
//        
//        if checkInternet() {
//            strTitle = Localizable.sharedInstance().localizedString(key: "system_error_title", comment: "")
//            attrTextCotent = NSMutableAttributedString(string: Localizable.sharedInstance().localizedString(key: "system_error_content", comment: ""), attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)])
//            let attrs : [NSAttributedString.Key: Any] = [
//                .font : UIFont.systemFont(ofSize: 14, weight: .regular),
//                .foregroundColor : UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
//            ]
//            let attrString = NSMutableAttributedString(string: "(\(errorHiFPT ?? "")).", attributes: attrs)
//            attrTextCotent.append(attrString)
//        } else {
//            strTitle = Localizable.sharedInstance().localizedString(key: "internet_connection_lost", comment: "")
//            attrTextCotent = NSMutableAttributedString(string: Localizable.sharedInstance().localizedString(key: "internet_connection_lost_describe", comment: ""), attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)])
//        }
//        return (strTitle, attrTextCotent)
//    }
//    
//    private static func getNetworkErrorMessage(_ errorHiFPT: String) -> String {
//        if checkInternet() {
//            return "\(Localizable.sharedInstance().localizedString(key: "system_error_content"))(\(errorHiFPT ))."
//        
//        } else {
//            return Localizable.sharedInstance().localizedString(key: "internet_connection_lost_describe")
//        }
//        
//    }
//    
//    // MARK: For debug
//    private static func logRequestForDebug(_ endPoint: HiFPTEndpoint, _ mHeaders: HTTPHeaders, _ params: Parameters?) {
//        let requestJSON: String = (params ?? [:]).getStringJsonFromDic() ?? ""
//        let message = """
//        --- Request info ---
//        ENDPOINT: \(endPoint.url.absoluteString)
//        HEADER: \(mHeaders)
//        BODY: \(requestJSON)
//        --------------------
//        """
//        HiFPTLogger.log(type: .debug, category: .apiService, message: message)
//    }
//    private static func logResponseForDebug(_ endPoint: HiFPTEndpoint, success result: JSON) {
//        let message = """
//        --- Response info ---
//        ENDPOINT: \(endPoint.url.absoluteString)
//        OUTPUT: \(result)
//        ---------------------
//        """
//        HiFPTLogger.log(type: .debug, category: .apiService, message: message)
//    }
//    
//    private static func logResponseForDebug(_ endPoint: HiFPTEndpoint, fail error: Error) {
//        let message = """
//        --- Response info ---
//        ENDPOINT: \(endPoint.url.absoluteString)
//        ERROR: \(error)
//        ---------------------
//        """
//        HiFPTLogger.log(type: .debug, category: .apiService, message: message)
//    }
//    
//    //MARK: Tracking API
//    static func trackingAPIError(vc: UIViewController?, statusResult: HiFPTStatusResult, endPoint: HiFPTEndpoint, params: Parameters?) {
//        if statusResult.statusCode != HiFPTStatusCode.SUCCESS.rawValue && HiFPTCore.shared.isOnTrackingErrorCode {
//            
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .callApiError("\(statusResult.statusCode)", statusResult.message, endPoint.url.absoluteString, params: params))
//        }
//    }
//    
//    static func trackingNetworkError(vc: UIViewController?, endPoint: HiFPTEndpoint, params: Parameters?, netError error: Error) {
//        if HiFPTCore.shared.isOnTrackingErrorCode{
//            HiFPTCore.shared.delegate?.shouldTracking(vc: vc, event: .callApiError("\(endPoint.errorCode ?? "")_\(error._code)", error.localizedDescription, endPoint.url.absoluteString, params: params))
//        }
//    }
}

extension DataRequest {
    func customValidate() -> Self {
        return self.validate { request, response, data -> Request.ValidationResult in
            let json = JSON(data as Any)
            let statusCode = json["statusCode"].intValue

            switch statusCode {
            case HiFPTStatusCode.AUTHEN_EXPIRE_TOKEN.rawValue:
                HiFPTLogger.log(type: .debug, category: .authenApi, message: "Validate request - Result: failure, dataJS: \(json)")
                return .failure(HiFAuthenApiError.accessTokenExpired)
            case HiFPTStatusCode.AUTHEN_EXPIRE_REFRESH_TOKEN.rawValue:
                HiFPTLogger.log(type: .debug, category: .authenApi, message: "Validate request - Result: failure, dataJS: \(json)")
                return .failure(HiFAuthenApiError.refreshTokenExpired(message: json["message"].stringValue))
            case HiFPTStatusCode.FORCE_UPDATE.rawValue:
                HiFPTLogger.log(type: .debug, category: .authenApi, message: "Validate request - Result: failure, dataJS: \(json)")
                return .failure(HiFAuthenApiError.forceUpdate(message: json["message"].stringValue))
            case HiFPTStatusCode.AUTHEN_NEED_OTP.rawValue:
                HiFPTLogger.log(type: .debug, category: .authenApi, message: "Validate request - Result: failure, dataJS: \(json)")
                return .failure(HiFAuthenApiError.needOTP(authCode: json["authCode"].stringValue))
            default:
                return .success(())
            }
        }
    }
}

