//
//  MyGlobal.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import UIKit
import SwiftyJSON
import Alamofire

struct PopupEContract {
    var isNeedShow: Bool = false
    var eContract : EContractConfirmModel = EContractConfirmModel.init()
    init() {
        self.isNeedShow = false
        self.eContract = EContractConfirmModel.init()
    }
}

class MyGlobal: NSObject {
    
    static var myClass:MyGlobal?
    static func shared()->MyGlobal{
        if(myClass == nil){
            myClass = MyGlobal()
        }
        return myClass ?? MyGlobal()
    }
    
    //KEY SAVE DATA
    let keyOnboardingVersion = "HIFPT_KEY_APP_ONBOARDING_VERSION"
    let keyIsCusomterFPT = "HIFPT_KEY_CUSTOMER_FPT"
    let keyCustomerId = "HIFPT_KEY_CUSTOMER_ID"
    let keyIsShowServiceGuide = "HIFPT_IS_SHOW_GUIDE_SORT"
    let keyHasShowBiometric = "HIFPT_KEY_HAS_SHOW_BIOMETRIC"
    let keyDeviceToken = "HIFPT_KEY_DEVICE_TOKEN_AUTHEN"
    let keyProvinceVersion = "HINEWSEVENT_PROVINCES_VERSION"
    let keyDistrictVersion = "HINEWSEVENT_DISTRICTS_VERSION"
    let keyWardVersion = "HINEWSEVENT_WARDS_VERSION"
    let keyCurrentTimeInterval = "HIFPT_KEY_CURRENT_TIME_INTERVAL"
    let keySession = "HIFPT_KEY_SESSION"
    let keyAppVersion = "HIFPT_KEY_APP_VERSION"
    let keyIsLoadEPG = "HIFPT_KEY_IS_LOAD_EPG"
    let keyBlockSendOTPHiTV = "HIFPT_KEY_BLOCK_SEND_OTP_HI_TV"
    let keySkipAlertEvent = "HIFPT_SKIP_ALERT_EVENT"
    let keyIsHideHintParentModem = "HIFPT_IS_HIDE_HINT_PARENT_MODEM"
    let keyIsNextOpenApp = "HIFPT_IS_NEXT_OPEN_APP"
    let keyIsCallAPISearchHistory = "HIFPT_IS_CALL_API_SEARCH_HISTORY"
    //let keyCacheBalanceSymbolFoxpay = "HIFPT_CACHE_BALANCE_SYMBOL_FOXPAY"
    let keyDataDeeplink = "HIFPT_KEY_DEEPLINK"
    let keyDataDeviceInfoModel = "HIFPT_KEY_DEVICEINFOMODEL"
    let keyShowTipTabbar = "SHOW_TIP_FSAFE"
    let keyShowTipModemFsafe = "SHOW_TIP_MODEM_FSAFE"
    
    let keyVersionAppDoNotRemind = "HIFPT_KEY_VERSIONAPPDONOTREMIND"
    let keyBiometricToken = "HIFPT_KEY_BIOMETRICTOKEN"
    
    //MARK: Test HiChatSDK
    var deviceVOIPToken = ""
    var deviceTokenString = ""
    
    //MARK: v6.8
    let keyDataInsuranceFlashIntro = "HIFPT_KEY_INSURANCE_FLASH_CACHE"
    
    var isAllowLoyalty: Bool = false
    var offlineNoti: NotificationModel?
//    var remoteNotification: RemoteNotificationModel?
//    var deviceInfoModel: DeviceInfoModel = DeviceInfoModel()
    //MARK: HiThemes
    var myThemes = ThemesManager.share().getThemes()
    //MARK: QuickGuideHome inviteUpdate forceUpdate
    var isInviteUpdateOrIsForceUpdate : Bool = false // check app show popup invite, force update

    //MARK: Cache Webkit
    var dataCacheWebkit : String = ""
    //MARK: Home Data
//    private var homeModel: HomeNewModel? = nil
//    
//    func setHomeModel(model: HomeNewModel) {
//        self.homeModel = model
//    }
//    func getHomeModel() -> HomeNewModel? {
//        return homeModel
//    }
//    func getFooterHomeConfig() -> HomeTabbarConfigModel?{
//        return self.homeModel?.footerConfig
//    }
//    func removeHomeModel(){
//        self.homeModel = nil
//    }
//    
    //MARK: check deeplink
    var fromDeeplink = false
    
    //MARK: - Contract
    var currentContract: ContractItem? {
        didSet{
//            print("khang: set current contract \(currentContract?.getContractNo())")
//            NotificationCenter.default.post(name: .didSelectContract, object: nil)
        }
    }
    var contracts:[ContractItem] = []
    var contractsActive: [ContractItem] {
        get {
            return contracts.filter({ $0.CustomerIsActive == 1 })
        }
    }
    func getContract(fromContractNo contractNo: String) -> ContractItem? {
        return contracts.first { contractItem in
            contractItem.Contract == contractNo
        }
    }
    func getDefaultContract() -> ContractItem? {
        return contractsActive.first { contract in
            contract.contractDefault == true
        }
    }
    
    func getContract(fromContractId contractId: String) -> ContractItem? {
        return contracts.first { contractItem in
            contractItem.id == contractId
        }
    }
    
    var socketEventId: String = ""
//    var socketCustomerReportId: String = ""
//    {
//        didSet{
//            //needReloadHome = true
//            NotificationCenter.default.post(name: .didSelectContract, object: nil)
//        }
//    }
//    
    var isShowAlertEvent:Bool = false
    var isShowPopupNoti: Bool = false
    var needReloadBalanceFoxpay: Bool = false
    //var checkVersion: CheckVersionModel? = ConfigsManager.shared().configData?.checkVersion - Quoc Remove 6.5.1
//    var baseNav:BaseNavigation? {
//        return HiFPTCore.shared.navigationController
//    }
    
    //v6.2
    var autoPayId: String = ""
    func setAutoPayId(autoPayId : String){
        self.autoPayId = autoPayId
    }
    
    //6.7 save token Biometric
    func getTokenBiometric() -> String {
        return UserDefaults.standard.string(forKey: keyBiometricToken) ?? ""
    }
    
    func saveTokenBiometric(tokenBiometric: String) {
        UserDefaults.standard.set(tokenBiometric, forKey: keyBiometricToken)
        UserDefaults.standard.synchronize()
    }
    
//    //Change key Save device token
//    
//    //Global var
//    let colorTitleContract: [ColorModel] = [
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.switchBlue), img: UIImage(named: "ic-shape-More24-primary")!, informationImg: UIImage(named: "ic-shape-info16-primary")!),
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textOrange), img: UIImage(named: "ic-shape-More24-orange")!, informationImg: UIImage(named: "ic-shape-info16-orange")!),
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textGreen), img: UIImage(named: "ic-shape-More24-green")!, informationImg: UIImage(named: "ic-shape-info16-green")!),
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textLightBlue), img: UIImage(named: "ic-shape-More24-blue")!, informationImg: UIImage(named: "ic-shape-info16-blue")!),
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textRed), img: UIImage(named: "ic-shape-More24-red")!, informationImg: UIImage(named: "ic-shape-info16-red")!),
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textViolet), img: UIImage(named: "ic-shape-More24-violet")!, informationImg: UIImage(named: "ic-shape-info16-violet")!),
//        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textOcean), img: UIImage(named: "ic-shape-More24-ocean")!, informationImg: UIImage(named: "ic-shape-info16-ocean")!)
//    ]
//    
//    var needReloadHome = false
//    var popupEContract: PopupEContract = PopupEContract.init()
//    
//    
//    //HDI 6.0
//    lazy var hdiBikeVehicaleInfoFee = VehicaleFeesModel()
//    lazy var hdiCarVehicaleInfoFee = VehicaleFeesModel()
//    lazy var HDITypeVehical : VEHICLE_TYPE = .MOTO
//    var hdiAddressWebkit : ListAddressModel?
//    //CTV
//    var isCurrentPhoneCanhTo:Bool {
//        return contractsActive.first(where: {$0.hiFPTCustomerTypeEnum == .CANHTO}) != nil
//    }
    
    var reloadContract = false
    
    
    fileprivate func getIsCustomerFPT() -> String{
        if let isCustomerFPT = UserDefaults.standard.string(forKey: self.keyIsCusomterFPT){
            return isCustomerFPT
        }
        return ""
    }
    
    func getOnboardingVersion() -> Int {
        return UserDefaults.standard.integer(forKey: keyOnboardingVersion)
    }
    
    func saveOnboardingVersion(version: Int?) {
        UserDefaults.standard.set(version, forKey: keyOnboardingVersion)
        UserDefaults.standard.synchronize()
    }
    
    func isCustomerOfFPT()->Bool{
        let isGuest = getIsCustomerFPT()
        if(isGuest == "YES"){
            return true
        }
        return false
    }
    
//    func getLanguage() -> String{
//        return HiFPTCore.shared.language.rawValue
//    }
//    
    func getCustomerId() -> String{
        if let customerId = UserDefaults.standard.string(forKey: self.keyCustomerId){
            return customerId
        }
        return ""
    }
    func saveCustomerId(cusId:String){
        UserDefaults.standard.setValue(cusId, forKey: keyCustomerId)
        UserDefaults.standard.synchronize()
    }
    
    func saveIsCustomerFPT(isCustFPT:String){
        UserDefaults.standard.setValue(isCustFPT, forKey: keyIsCusomterFPT)
        UserDefaults.standard.synchronize()
    }
    
//    func getPhoneNumber() -> String{
//        return HiFPTCore.shared.phone ?? ""
//    }
//    
//    func savePhone(phoneStr:String?){
//        HiFPTCore.shared.phone = phoneStr
//    }
//    
//    func getFullName() -> String{
//        return HiFPTCore.shared.fullName ?? ""
//    }
//    func saveFullName(fullNameStr:String?){
//        HiFPTCore.shared.fullName = fullNameStr
//    }
//    
//    func saveKeepMeLoggedIn(status:Bool?){
//        HiFPTCore.shared.isKeepSession = status ?? true
//    }
//    
//    func getAvatarUrl() -> String {
//        return HiFPTCore.shared.avatarUrl ?? ""
//    }
//    func saveAvatarUrl(url: String?){
//        HiFPTCore.shared.avatarUrl = url
//    }
    
    func getHasShowBiometric() -> Bool{
        let isShow = UserDefaults.standard.bool(forKey: keyHasShowBiometric)
        return isShow
    }
    func saveHasShowBiometric(isShow:Bool){
        UserDefaults.standard.set(isShow, forKey: keyHasShowBiometric)
        UserDefaults.standard.synchronize()
    }
    
    func getDeviceToken() -> String {
        if let deviceTokenStr = UserDefaults.standard.string(forKey: self.keyDeviceToken){
            return deviceTokenStr
        }
        return "simulator or not allow"
    }
    func saveDeviceToken(deviceTokenStr:String) {
        UserDefaults.standard.setValue(deviceTokenStr, forKey: self.keyDeviceToken)
        UserDefaults.standard.synchronize()
    }
    
    //MARK: [HI NEWS EVENT] - GET - SAVE VERSION LOCATION
    func getProvinceVersion() -> String {
        if let provinceVersion = UserDefaults.standard.string(forKey: self.keyProvinceVersion){
            return provinceVersion
        }
        return "0"
    }
    
    func getDistrictVersion() -> String {
        if let districtVersion = UserDefaults.standard.string(forKey: self.keyDistrictVersion){
            return districtVersion
        }
        return "0"
    }
    
    func getWardVersion() -> String {
        if let wardVersion = UserDefaults.standard.string(forKey: self.keyWardVersion){
            return wardVersion
        }
        return "0"
    }
    
    func saveVersionLocalProvince(provinceVersion: String){
        UserDefaults.standard.setValue(provinceVersion, forKey: keyProvinceVersion)
        UserDefaults.standard.synchronize()
    }
    func saveVersionLocalDistrict( districtVersion: String){
        UserDefaults.standard.setValue(districtVersion, forKey: keyDistrictVersion)
        UserDefaults.standard.synchronize()
    }
    func saveVersionLocalWard(wardVersion: String){
        UserDefaults.standard.setValue(wardVersion, forKey: keyWardVersion)
        UserDefaults.standard.synchronize()
    }
    
    func saveIsLoadEPG(isLoad:Bool) {
        UserDefaults.standard.set(isLoad, forKey: keyIsLoadEPG)
        UserDefaults.standard.synchronize()
    }
    
    func getIsLoadEPG() -> Bool {
        let isLoad = UserDefaults.standard.bool(forKey: keyIsLoadEPG)
        return isLoad
    }
    
//    func showLoading(vc: UIViewController?) {
//        guard let _vc = vc else {
//            if let navVC = HiFPTCore.shared.navigationController {
//                HiFPTCore.shared.showLoading(vc: navVC)
//                return
//            }
//            return
//        }
//        HiFPTCore.shared.showLoading(vc: _vc)
//    }
//    
//    func hideLoading() {
//        HiFPTCore.shared.hideLoading()
//    }
//    
    func openLinkWithOSbrowser(strURL: String) {
        if let url = URL(string: strURL) {
            UIApplication.shared.open(url)
        }
    }
    
    func openAppStoreForReview(strURL: String) {
        if let safeUrl = URL(string: strURL) {
            if var urlComponents = URLComponents(url: safeUrl, resolvingAgainstBaseURL: false) {
                urlComponents.queryItems = [
                    URLQueryItem(name: "action", value: "write-review")
                ]
                
                guard let writeReviewURL = urlComponents.url else {
                    return
                }
                
                UIApplication.shared.open(writeReviewURL)
            } else {
                print("Error urlComponents: \(safeUrl.debugDescription)")
            }
        } else {
            print("Error safeUrl: \(strURL)")
        }
    }
    
    func shareActivityWithLink(vc: UIViewController, strLink: String) {
        if let urlStr = NSURL(string: strLink) {
            let objectsToShare = [urlStr]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            if UI_USER_INTERFACE_IDIOM() == .pad {
                if let popup = activityVC.popoverPresentationController {
                    popup.sourceView = vc.view
                    popup.sourceRect = CGRect(x: vc.view.frame.size.width / 2, y: vc.view.frame.size.height / 4, width: 0, height: 0)
                }
            }
            
            vc.present(activityVC, animated: true, completion: nil)
        }
    }
    
//    func getConnectedWifiInfo( handler: @escaping ( (_ ssid: [AnyHashable: Any]) ->()) ) -> Void {
//        let dispatchGroup = DispatchGroup()
//        var isConnectedEthernetOrWiFi = false
//        //Check Type connect
//        let reachabilityManager = NetworkReachabilityManager()
//        dispatchGroup.enter()
//        reachabilityManager?.startListening(onUpdatePerforming: { status in
//            switch status {
//                case .notReachable:
//                    break
//                case .unknown:
//                    break
//                case .reachable(.ethernetOrWiFi):
//                    isConnectedEthernetOrWiFi = true
//                case .reachable(.cellular):
//                    break
//            }
//            dispatchGroup.leave()
//        })
//        
//        dispatchGroup.notify(queue: .main) {
//            if isConnectedEthernetOrWiFi {
//                //Check GPS permission
//                if CLLocationManager.locationServicesEnabled() {
//                    /// GPS enable true
//                    switch CLLocationManager.authorizationStatus() {
//                        case .restricted, .denied:
//                            // No access
//                            handler(self.getNameSSID())
//                        case .authorizedAlways, .authorizedWhenInUse:
//                            // Access
//                            handler(self.getNameSSID())
//                        case .notDetermined:
//                            handler(self.getNameSSID())
//                        @unknown default:
//                            fatalError("getConnectedWifiInfo - Error")
//                    }
//                } else {
//                    /// GPS enable false
//                    handler(self.getNameSSID())
//                }
//            } else {
//                //WWLAN
//                handler([:])
//            }
//        }
//        
//    }
//    
//    func getNameSSID() -> [AnyHashable: Any] {
//        
//        
//        if let ifs = CFBridgingRetain( CNCopySupportedInterfaces()) as? [String],
//           let ifName = ifs.first as CFString?,
//           let info = CFBridgingRetain( CNCopyCurrentNetworkInfo((ifName))) as? [AnyHashable: Any] {
//            print(info[kCNNetworkInfoKeySSID as String] as? String ?? "" )
//            
//            return info
//        } else {
//            return ["SSID" : "modem_unknown_SSID"/*Localizable.shared.localizedString(key: "modem_unknown_SSID", comment: "")*/]
//        }
//        
//    }
    
    func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
    
    //MARK: - Call when logout
//    func clearAllCache(){
//        UserDefaults.standard.removeObject(forKey: keyCustomerId)
//        UserDefaults.standard.removeObject(forKey: keyIsCusomterFPT)
//        let managerContract = RealmManager<ContractModel>()
//        let managerConfigs = RealmManager<ConfigAppModel>()
//        let managerHDI = RealmManager<HDIinsuranceInfo>()
//        let managerNoti = RealmManager<NotificationModel>()
//        let managerEventSocket = RealmManager<EventSocketData>()
//        let managerLogService = RealmManager<LogActionService>()
//        let managerRemind = RealmManager<RlmNotifications>()
//        let managerRemindPeriod = RealmManager<RlmRemindPeriod>()
//        let managerSearchHistory = RealmManager<RlmHistorySearchModel>()
//        let managerTips = RealmManager<TipsModel>()
//        let managerEcomLocal = RealmManager<EcomNewTagRealmModel>()
//        let managerRouterLocal = RealmManager<RouterNewTagRealmModel>()
//        
//        managerSearchHistory.deleteAllData()
//        managerRemind.deleteAllData()
//        managerContract.deleteAllData()
//        managerConfigs.deleteAllData()
//        managerHDI.deleteAllData()
//        managerNoti.deleteAllData()
//        managerEventSocket.deleteAllData()
//        managerLogService.deleteAllData()
//        managerRemindPeriod.deleteAllData()
//        managerTips.deleteAllData()
//        managerEcomLocal.deleteAllData()
//        managerRouterLocal.deleteAllData()
//        
//        HomeNewManager.share.resetRemindTips()
//        
//        ContractManager.shared().didCallApiSuccess = false
//        ConfigsManager.shared().didCallApi = false
//        
//        HDIManager.shared().didCallApi = false
//        
//        saveDeviceToken(deviceTokenStr: "simulator or not allow") // Server gọi logout: Gỡ bỏ device token khi đăng xuất -> client cũng vậy
//        HiFPTCore.shared.isKeepSession = false // trạng thái lưu phiên reset thành OFF
//        
//        homeInstance.closeSocketEventHome()
//        HiFChatSocket.shared.disconnect()
//        
//        PaymentManager.shared.logoutFoxpay()
//        LoyaltyManager.shared.logoutLoyalty()
//        
//        saveHasShowBiometric(isShow: false)
//        resetDefaultVaule()
//        
//        KingfisherManager.shared.cache.clearMemoryCache()
//        KingfisherManager.shared.cache.clearDiskCache()
//        KingfisherManager.shared.cache.cleanExpiredDiskCache()
//        
//        isShowPopupNoti = false //Không show notification khi logout
//        //        loyaltyInfo = nil // Xoa thong tin loyalty user
//        //Version 6.6 notification local
//        let localNotifyManager = LocalNotificationManager()
//        localNotifyManager.deleteAll()
//        saveAppversionAppDoNotRemind(versionApp: "")
//        
//        ///Remove data Home Master Raw when expire session app
//        removeHomeModel()
//        
//        // logout hichatsdk
//        HiFChatSDK.shared.logout()
//        HomeNewManager.share.newMessageFromChat = false
//        
//        /// Deinit PreloadWebkitManager
//        PreloadWebkitManager.releaseShareInstance()
//        ///Clear  cache webkit
//        self.dataCacheWebkit = ""
//        
//        ///clear cache popup, adsView
//        AdsViewManager.share().adsViewIdHasSeen = nil
//        PopupQueueManager.share().listPopupIDHasSeen = []
//    }
//    
//    func clearTips() {
//        let managerTips = RealmManager<TipsModel>()
//        managerTips.deleteAllData()
//    }
//    
//    func clearTips(exclusive: [Int]) {
//        let managerTips = RealmManager<TipsModel>()
//        managerTips.deleteAllExcept(exclusivePrimary: exclusive, primaryName: "tipsId")
//    }
//    
//    private func resetDefaultVaule(){
//        MyGlobal.shared().currentContract = nil
//        MyGlobal.shared().contracts = []
//        MyGlobal.shared().hdiBikeVehicaleInfoFee = VehicaleFeesModel()
//        MyGlobal.shared().hdiCarVehicaleInfoFee = VehicaleFeesModel()
//        isShowAlertEvent = false
//        needReloadBalanceFoxpay = false
//        UserDefaults.standard.removeObject(forKey: keySkipAlertEvent)
//        //UserDefaults.standard.removeObject(forKey: keyCacheBalanceSymbolFoxpay)
//    }
//    
//    func clearOptionBiometricCache(){
//        UserDefaults.standard.removeObject(forKey: keyCustomerId)
//        let managerContract = RealmManager<ContractModel>()
//        let managerConfigs = RealmManager<ConfigAppModel>()
//        let managerHDI = RealmManager<HDIinsuranceInfo>()
//        let managerNoti = RealmManager<NotificationModel>()
//        let managerEventSocket = RealmManager<EventSocketData>()
//        let managerLogService = RealmManager<LogActionService>()
//        let managerTips = RealmManager<TipsModel>()
//        let managerEcomLocal = RealmManager<EcomNewTagRealmModel>()
//        let managerRouterLocal = RealmManager<RouterNewTagRealmModel>()
//        
//        managerContract.deleteAllData()
//        managerConfigs.deleteAllData()
//        managerHDI.deleteAllData()
//        managerNoti.deleteAllData()
//        managerEventSocket.deleteAllData()
//        managerLogService.deleteAllData()
//        managerTips.deleteAllData()
//        managerEcomLocal.deleteAllData()
//        managerRouterLocal.deleteAllData()
//        
//        HomeNewManager.share.resetRemindTips()
//        
//        ContractManager.shared().didCallApiSuccess = false
//        ConfigsManager.shared().didCallApi = false
//        
//        HDIManager.shared().didCallApi = false
//        
//        saveDeviceToken(deviceTokenStr: "relogin biometric device token") // Server gọi logout: Gỡ bỏ device token khi đăng xuất -> client cũng vậy
//        HiFPTCore.shared.isKeepSession = false // trạng thái lưu phiên reset thành OFF
//        
//        homeInstance.closeSocketEventHome()
//        
//        PaymentManager.shared.logoutFoxpay()
//        LoyaltyManager.shared.logoutLoyalty()
//        //Không show notification khi logout
//        MyGlobal.shared().isShowPopupNoti = false
//        resetDefaultVaule()
//        //        loyaltyInfo = nil // Xoa thong tin loyalty user
//        ///Remove data Home Master Raw when expire session app
//        removeHomeModel()
//    }
    
    func getCurrentTimeInterval() -> Double {
        let currentTime = Date().timeIntervalSince1970
        let diffServerTime = UserDefaults.standard.double(forKey: self.keyCurrentTimeInterval)
        return currentTime + diffServerTime
    }
    
    func checkInternet()->Bool{
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func getSession() -> String{
        if let session = UserDefaults.standard.string(forKey: self.keySession){
            return session
        }
        return ""
    }
    func openLink(strURL: String) {
        if let url = URL(string: strURL) {
            if #available(iOS 10, *){
                UIApplication.shared.open(url)
            }else{
                UIApplication.shared.openURL(url)
            }
        }
    }
//    
//    func getSupportBiometricType() -> AuthenBiometricType {
//        let mContext = LAContext()
//        if #available(iOS 11, *) {
//            let _ = mContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
//            switch(mContext.biometryType) {
//                case .none:
//                    return .none
//                case .touchID:
//                    return .touchId
//                case .faceID:
//                    return .faceId
//            case .opticID:
//                return .none
//            }
//        } else {
//            return mContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchId : .none
//        }
//    }
//    
    func getAppVersion() -> String{
        if let appVerStr = UserDefaults.standard.string(forKey: self.keyAppVersion){
            return appVerStr
        }
        return ""
    }
    
    func getSkipAlertEvent() -> [String]{
        return UserDefaults.standard.stringArray(forKey: keySkipAlertEvent) ?? []
    }
    
    func saveSkipAlertEvent(arrStr: [String]){
        UserDefaults.standard.set(arrStr, forKey: keySkipAlertEvent)
        UserDefaults.standard.synchronize()
    }
    
    func removeOldSession(){
        UserDefaults.standard.removeObject(forKey: keySession)
    }
    
    func clearEventSocket() {
        
        //        let localSocketEvent: [EventSocketModel] = EventSocketModel.mr_findAll() as! [EventSocketModel]
        //
        //        for item in localSocketEvent {
        //            item.mr_deleteEntity()
        //        }
        //
        //        NSManagedObjectContext.mr_default().mr_saveToPersistentStore(completion: nil)
        //    }
        //    func clearOptionBiometricCache(){
        //        UserDefaults.standard.removeObject(forKey: keyCustomerId)
        //        UserDefaults.standard.removeObject(forKey: keyIsCusomterFPT)
        //        UserDefaults.standard.removeObject(forKey: keyAvatarUrl)
        //        contracts = []
        //        currentContract = nil
        //        contractsActive = []
        //        allowedFunctions = AllowedFunctions()
        //        homePriority = [
        //            HomePriority(pri: 700, na: "bill"),
        //            HomePriority(pri: 600, na: "report"),
        //            HomePriority(pri: 500, na: "wifi")
        //        ]
        //        dataModemHome = []
        //        dataBillingHome = []
        //        dataPrepaidHome = []
        //        dataSupportHome = []
        //        customerInfo = nil
        //        UserDefaults.standard.removeObject(forKey: keyCurrentContractId)
        //        UserDefaults.standard.removeObject(forKey: keyIsShowServiceLinkApp)
        //        UserDefaults.standard.removeObject(forKey: keyIsLoadEPG)
        //        UserDefaults.standard.removeObject(forKey: keyBlockSendOTPHiTV)
        //        UserDefaults.standard.synchronize()
        //
        //        self.clearNotifycationWithStyle(style: "ALL")
        self.clearEventSocket()
    }
    //
    //    func clearNotifycationWithStyle(style: String, localContext: NSManagedObjectContext? = nil, saveInClosure:Bool = false) {
    //        guard let lclContext = localContext else {
    //            if style == "ALL" {
    //                let localNoti: [Notify] = Notify.mr_findAll() as? [Notify] ?? [Notify]()
    //                for item in localNoti {
    //                    item.mr_deleteEntity()
    //                }
    //                NSManagedObjectContext.mr_default().mr_saveToPersistentStore(completion: nil)
    //            } else {
    //                let searchCondition = NSPredicate(format: "saveInApp LIKE %@", "0")
    //                let localNoti: [Notify] = Notify.mr_findAll(with: searchCondition) as? [Notify] ?? [Notify]()
    //                for item in localNoti {
    //                    item.mr_deleteEntity()
    //                }
    //                NSManagedObjectContext.mr_default().mr_saveToPersistentStore(completion: nil)
    //            }
    //            return
    //        }
    //
    //        if style == "ALL" {
    //            let localNoti: [Notify] = Notify.mr_findAll(in: lclContext) as? [Notify] ?? [Notify]()
    //            for item in localNoti {
    //                item.mr_deleteEntity(in: lclContext)
    //            }
    //            if saveInClosure {
    //                lclContext.mr_saveToPersistentStore(completion: nil)
    //            }
    //
    //        } else {
    //            let searchCondition = NSPredicate(format: "saveInApp LIKE %@", "0")
    //            Notify.mr_deleteAll(matching: searchCondition, in: lclContext)
    //            if saveInClosure {
    //                lclContext.mr_saveToPersistentStore(completion: nil)
    //            }
    //        }
    //
    //}
//    func setIsNeedShowPopupEContractDefault() {
//        self.popupEContract.isNeedShow = false
//        self.popupEContract.eContract = EContractConfirmModel.init()
//    }
//    func setIsNeedShowPopupEContract(isNeed: Bool, eContract: EContractConfirmModel) {
//        self.popupEContract.isNeedShow = isNeed
//        self.popupEContract.eContract = eContract
//    }
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.utf8)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    ///Generate QRCode by string, Can set color QR and scale.
    ///In there: scale is image resolution
    func generateQRCodeWithColor(from string: String, color: UIColor, scale: CGFloat) -> UIImage? {
        guard let data = string.data(using: String.Encoding.utf8),
              let qrFilter = CIFilter(name: "CIQRCodeGenerator"),
              let colorFilter = CIFilter(name: "CIFalseColor") else {
            return nil
        }
        qrFilter.setValue(data, forKey: "inputMessage")
        qrFilter.setValue("H", forKey: "inputCorrectionLevel")
        
        let ciColor = CIColor(color: color)
        colorFilter.setValue(qrFilter.outputImage, forKey: "inputImage")
        colorFilter.setValue(ciColor, forKey: "inputColor0")
        colorFilter.setValue(CIColor.clear, forKey: "inputColor1")
        
        guard let outputImage = colorFilter.outputImage else {
            return nil
        }
        let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
        return UIImage(ciImage: transformedImage)
    }
    func formatMoneyToString(amnt: Int, currency: String = "đ") -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        if let formatMoney = formatter.string(from: amnt as NSNumber) {
            return formatMoney + currency
        }
        return String(amnt)
    }
    
    func saveIsHideHintParentControl(isHide: Bool){
        UserDefaults.standard.setValue(isHide, forKey: keyIsHideHintParentModem)
        UserDefaults.standard.synchronize()
    }
    
    func getIsCallAPISearchHistory() -> Bool {
        let isNextOpenApp = UserDefaults.standard.string(forKey: keyIsCallAPISearchHistory)
        if isNextOpenApp == nil || isNextOpenApp == "" {
            return false
        }
        return true
    }
    
    func setIsCallAPISearchHistory(isCallAPISearchHistory: Bool) {
        if isCallAPISearchHistory {
            UserDefaults.standard.set("TRUE", forKey: keyIsCallAPISearchHistory)
            UserDefaults.standard.synchronize()
        }
        else {
            UserDefaults.standard.set(nil, forKey: keyIsCallAPISearchHistory)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getIsNextOpenApp() -> Bool {
        let isNextOpenApp = UserDefaults.standard.string(forKey: keyIsNextOpenApp)
        if isNextOpenApp == nil || isNextOpenApp == "" {
            return false
        }
        return true
    }
    
    func setIsNextOpenApp(isNextOpenApp: Bool) {
        if isNextOpenApp {
            UserDefaults.standard.set("TRUE", forKey: keyIsNextOpenApp)
            UserDefaults.standard.synchronize()
        }
        else {
            UserDefaults.standard.set(nil, forKey: keyIsNextOpenApp)
            UserDefaults.standard.synchronize()
        }
    }
    func getCurrentVersionName() -> String{
        
        if let versionName = Bundle.main.infoDictionary?["CFBundleShortVersionString"]  as? String {
            return versionName
        }
        return "7.0"
        
    }
    /*
     func getCacheFoxpayBalanceSymbol() -> String {
     if let str = UserDefaults.standard.string(forKey: keyCacheBalanceSymbolFoxpay) {
     return str
     }
     return ""
     }
     
     func setCacheFoxpayBalanceSymbol(strSymbol: String) {
     UserDefaults.standard.set(strSymbol, forKey: keyCacheBalanceSymbolFoxpay)
     UserDefaults.standard.synchronize()
     }
     */
    
    //MARK: deeplink
//    func setDataDeeplink(navModel: NavigationModel?) {
//        if let navModel = navModel {
//            if let data = try? JSONSerialization.data(withJSONObject: navModel.parseToDic()) {
//                UserDefaults.standard.set(data, forKey: keyDataDeeplink)
//            }
//        } else {
//            UserDefaults.standard.removeObject(forKey: keyDataDeeplink)
//        }
//        UserDefaults.standard.synchronize()
//    }
    
//    func getDataDeeplink() -> NavigationModel? {
//        if let navModelData = UserDefaults.standard.object(forKey: keyDataDeeplink) as? Data {
//            if let navModelDic = try? JSONSerialization.jsonObject(with: navModelData) as? [String: Any] {
//                let json = JSON(navModelDic)
//                return NavigationModel(fromJSON: json)
//            }
//        }
//        return nil
//    }
//    
//    //6.3 Device
//    func setDataDeviceInfoModel(device: DeviceInfoModel?) {
//        if device != nil {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(device) {
//                let defaults = UserDefaults.standard
//                defaults.set(encoded, forKey: keyDataDeviceInfoModel)
//                UserDefaults.standard.synchronize()
//            }
//        } else {
//            UserDefaults.standard.removeObject(forKey: keyDataDeviceInfoModel)
//            UserDefaults.standard.synchronize()
//        }
//    }
//    
//    func getDataDeviceInfoModel() -> DeviceInfoModel?{
//        let defaults = UserDefaults.standard
//        if let savedPerson = defaults.object(forKey: keyDataDeviceInfoModel) as? Data {
//            let decoder = JSONDecoder()
//            if let loadedPerson = try? decoder.decode(DeviceInfoModel.self, from: savedPerson) {
//                return loadedPerson
//            }
//        }
//        return nil
//    }
    //v6.5.1
    func saveAppversionAppDoNotRemind(versionApp: String) {
        UserDefaults.standard.setValue(versionApp, forKey: keyVersionAppDoNotRemind)
        UserDefaults.standard.synchronize()
    }
    
    func setTipTabbar (isBool : Bool) {
        UserDefaults.standard.set(isBool, forKey: keyShowTipTabbar)
        UserDefaults.standard.synchronize()
    }
    func getTipTabbar() -> Bool{
        let isBool = UserDefaults.standard.bool(forKey: keyShowTipTabbar)
        return isBool
    }
    func setTipModemFsafe (isBool : Bool) {
        UserDefaults.standard.set(isBool, forKey: keyShowTipModemFsafe)
        UserDefaults.standard.synchronize()
    }
    func getTipModemFsafe() -> Bool{
        let isBool = UserDefaults.standard.bool(forKey: keyShowTipModemFsafe)
        return isBool
    }
    
    func getAppversionAppDoNotRemind() -> String {
        if let appVerStr = UserDefaults.standard.string(forKey: self.keyVersionAppDoNotRemind){
            return appVerStr
        }
        return ""
    }
    //MARK: v6.8
//    func setDataFlashIntroInsurance(introData: InfoFlashInsuranceModel?) {
//        if introData != nil {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(introData) {
//                let defaults = UserDefaults.standard
//                defaults.set(encoded, forKey: keyDataInsuranceFlashIntro)
//                UserDefaults.standard.synchronize()
//            }
//        } else {
//            UserDefaults.standard.removeObject(forKey: keyDataInsuranceFlashIntro)
//            UserDefaults.standard.synchronize()
//        }
//    }
//    
//    func getDataFlashIntroInsurance() -> InfoFlashInsuranceModel{
//        let defaults = UserDefaults.standard
//        if let savedDataIntro = defaults.object(forKey: keyDataInsuranceFlashIntro) as? Data {
//            let decoder = JSONDecoder()
//            if let loadedDataIntro = try? decoder.decode(InfoFlashInsuranceModel.self, from: savedDataIntro) {
//                return loadedDataIntro
//            }
//        }
//        return InfoFlashInsuranceModel(imgUrl: "insurance_default_flash_icon", titles: [Localizable.shared.localizedString(key: "insurance_flash_title_cache_1"), Localizable.shared.localizedString(key: "insurance_flash_title_cache_2") ], info: [Localizable.shared.localizedString(key: "insurance_flash_info_cache_1"), Localizable.shared.localizedString(key: "insurance_flash_info_cache_2")], animUrl: "")
//        
//    }
}

