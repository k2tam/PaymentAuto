//
//  Constants.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//


import UIKit

struct Constants {
    
    static let OAUTH_CLIENT_ID:String = "Hi_FPT"
    static let GOOGLE_CLIENT_ID = "276843632227-13eut9sas10cg6drpoq0vcp3vr9r1gbt.apps.googleusercontent.com"
    
    // Hi-Auth
    static let kChannel = "channel"
    static let kClientId = "clientId"
    static let kCodeChallenge = "codeChallenge"
    static let kCodeVerifier = "codeVerifier"
    static let kGrantType = "grantType"
    static let kBindingCode = "bindingCode"
    static let kBiometryToken = "biometryToken"
    static let kSignature = "Signature"
    static let kAuthorization = "Authorization"
    static let kRefreshToken = "refreshToken"
    static let kAuthenticatorId = "authenticatorId"
    static let kPhone = "phone"
    static let kCode = "code"
    static let kProviderType = "providerType"
    static let kProviderId = "providerId"
    static let kProviderAccessToken = "providerAccessToken"
    static let kIsOtp = "isOtp"
    static let kOtp = "otp"
    static let kPassword = "password"
    static let kSamePassword = "samePassword"
    static let kDevicePlatform = "devicePlatform"
    static let kDeviceName = "deviceName"
    
    // Hi-Customer
    static let kLanguage = "language"
    
    // Biometric
    static let kServerAuthen = "hi.fpt.vn"
    static let kDeviceId = "deviceId"
    static let kCustomerId = "customerId"
    
    // E-Contract
    static let kContractId = "contractId"
    static let kOTPKey = "otpKey"
    static let kEContractId = "eContractId"
    
    //6.7 Login SSO
    static let kState = "state"
    
    static let KEY_MAP = "AIzaSyACsw0EkCyEpn9feQr_0iyIWJQEW4Cx2_0"
    static let PLATFORM:String = "iOS"
    static let API_KEY_TRACKING = "fbdd810b6c6951fc5662e87bac347e4f62d06263"
    static let URL_DIRECTION = "https://maps.googleapis.com/maps/api/directions/json?key=" + KEY_MAP + "&"
    static let TOAST_TIME:Double = 2.0
    static let WEBKIT_TIMEOUT:Double = 10
    static let CACHE_IMAGE_EXPIRED_DAY:Int = 1
    static let kHi_FPT_URL_Store = "https://apps.apple.com/vn/app/hi-fpt/id1144417173"
    static let kHi_TRACKING_URL_ERRORCODE = "https://ansoft.com.vn"
    
    //MARK: - Storyboard Name
    struct StoryboardName {
        static let kHome = "Home"
        static let kContract = "Contract"
        static let kTV = "TV"
        static let kStoryBoardAuthen = "Authentication"
        static let kStoryBoardConnectService = "ConnectService"
        static let kNotification = "Notification"
        static let kContactLocator = "Contact"
        static let kSupport = "Support"
        static let kCustomView = "CustomView"
        static let kPopup = "Popup"
        static let kStoryBoardSupportOptimalAssign = "SupportOptimalAssign"
        static let kWelcome = "Welcome"
        static let kChat = "Chat"
        
        static let kHDI = "HDI"
        static let kMyRating = "MyRating"
        static let kSettings = "Settings"
        static let kIPCamera = "IPCamera"
        static let kProfile = "Profile"
        static let kListProduct = "ListProduct"
        //MARK: V5.14
        static let kRegisterCTVwebStoryBoard = "RegisterCTVweb"
        static let kBroadcast = "Broadcast"
        static let kFSecure = "FSecure"
        
        //MARK: EventSocket
        static let kEventSocket = "EventSocket"

        //MARK: ServiceInWebkit
        static let kServiceInWebkitStoryBoard = "ServiceInWebKit"
 
        static let kVoucher = "Voucher"
        //MARK: v6.2
        static let kChangeInfoContract = "ChangeInfoContract"
        static let kChangeAddressContract = "ChangeAddressContract"
        static let kTransactionHistory = "TransactionHistory"
        static let kChangePayment = "ChangePayment"
        
        //MARK: v6.4
        static let kDevice = "Device"
        static let kContractSetting = "ContractSetting"
        static let kAuthenModem = "AuthenModem"
        static let kListAddress = "ListAddress"
        
        //MARK: v6.6
        static let kFSafeUser = "FSafeUser"
        static let kPayment = "Payment"
        
        //MARK: v6.8
        static let kInsuranceFlashScreen = "InsuranceFlashScreen"
        static let kInsuranceHome = "InsuranceHome"
        static let kInsuranceListProduct = "InsuranceListProduct"
        static let kInsuranceWebkit = "InsuranceWebkit"
        ///Change Payment Method
        static let kChangePaymentMethod = "ChangePaymentMethod"
        //MARK: v7.0
        static let kVisualizedNetwork = "VisualizedNetwork"
        
    }
    //MARK: - Storyboard Id
    struct StoryboardId {
        
        static let KListExclusiveOfferVC = "ListExclusiveOfferVC"
        static let kSearchHome = "SearchHome"
        static let kCustomizeFavouritesVC = "CustomizeFavouritesVC"
        static let kModemMainFunctionVC = "modemMainFunctionVC"
        static let kModemMainVC = "ModemMainController"
        static let kGuidelineFavouriteVC = "GuidelineFavoriteVC"
        //Contract
        static let kContract = "Contract"
        static let kListCamera = "ListCamera"
        static let kMTVMainFunctionVC = "TVViewController"
        static let kBiometricSetupVC = "biometricSetupController"
        static let kPopupBiometricStep = "popupBiometricStepController"
        static let kPopupBiometricRequire = "popupBiometricRequireController"
        static let kModemActiveOTPIdScreen = "modemOTPVC"
        static let kModemBiometricMethodVC = "modemBiometricMethodVC"
        static let kHomeVC = "HomeController"
        static let kSortServiceIdScreen = "sortContractVC"
        static let kPopupSortServiceIdScreen = "popupTutorialSortVC"
        static let kPopupNotificationViewController = "popupNotificationViewController"
        static let kContactScreen = "contactLocatorVC"
        static let kContactOfficesNearScreen = "contactNearOffices"
        static let kSearchOfficeByProvinceVC = "searchOfficeByProvinceVC"
        static let kSupportNoteViewController = "supportNoteViewController"
        static let kChargeRequestScheduleViewController = "chargeRequestScheduleViewController"
        static let kSupportInformationViewController = "supportInformationViewController"

        static let kChargeDatePicker = "ChargeDatePicker"
        static let kPopupManagerContract = "popupManagerContractController"
        static let kPopupVC = "CustomAlertViewVC"
        static let kPopupBottomVC = "PopupBottomVC"
        static let kPopupBotScheduleVC = "ScheduleResetModemVC"
        static let kPopupBotTurnOffModemVC = "ScheduleTurnOffModemVC"
        static let kPopupNotifVC = "PopularPopupVC"
        static let kPopupSettingVC = "PopupSettingVC"
        static let kPopupMessageVC = "PopupMessageVC"
        static let kPopupRatingVC = "PopupRatingVC"
        static let kPopupRatingMainVC = "PopupRatingMainVC"
        static let kPopupBigMessageVC = "PopupBigMessageVC"
        static let kPopupRetryVC = "popupRetryController"
        static let kProcedureChangeInfoContactSPViewController = "procedureChangeInfoContactSPViewController"
        static let kPopupOptimalSupportVC = "popupOptimalSupportVC"
        static let kPopupCreateSupport = "popupCreateSupport"
        static let kEditScheduleRequest = "editRequest"
        static let kSupportCreateTechnical = "supportCreateTechnical"
        static let kpopupEditInfoVc = "popupEditInfoVc"
        static let kPopupChangeOwnerSPViewController = "popupChangeOwnerSPViewController"
        static let kChargeSchedulePopup = "ChargeSchedulePopup"
        static let kTrackingEmployeeSupport = "trackingEmployeeVC"
        static let kPopupSurveyVC = "PopupSurveyVC"
        static let kPopupSurveySuccessVC = "PopupSurveySuccessVC"
        static let kListEmployeeSupportVC = "listEmployeeSupportVC"
        static let kTechnicalRequestScheduleViewController = "technicalRequestScheduleViewController"
        static let kStoryBoardSupportOptimalAssign = "SupportOptimalAssign"
        static let kSPOptimalNoteVC = "sPOptimalNoteVC"
        static let kWelcomeVC = "WelcomeVC"
        static let kLinkServiceForguestVC = "linkServiceForGuestVC"
        static let kFeedbackForHomeVC = "feedbackForHomeVC"
        static let kKnowSettingVC = "knowAppSettingVC"
        static let kPopularToastPopupVC = "PopularToastPopupVC"
        static let kPopupOTPPayment = "PopupOTPPayment"
        static let kPopupConfirmPayment = "PopupConfirmPayment"
        //CHAT
        static let kChatMainConversationVC = "MainConversationVC"
        static let kChatConversationVC = "ConversationViewController"
        static let kChatConversationDetailVC = "ConversationDetailViewController"
        
        //Introduce
        static let kPopupReferralWKVC = "PopupReferralWKVC"
        static let kIntroReferallVC = "introReferallVC"
        static let kIntroRegisterForFriendVC = "IntroRegisterForFriendVC"
        static let kHistoryReferralVC = "historyReferralVC"
        static let kRegisterForFriendWKVC = "registerForFriendWKVC"
        static let kConfirmInsuranceController = "kConfirmInsuranceController"
        static let kInfoInsuranceController = "kInfoInsuranceController"
        static let kBikeInsuranceController = "kBikeInsuranceController"
        static let kDetailHDIController = "kDetailHDIController"
        static let kHDIController = "kHDIController"
        static let kHDIinsuranceVC = "HDIinsuranceVC"
        //MyRatingVC
        static let kMainMyRatingVC = "MainMyRatingVC"
        static let kHistoryRatingDetailVC = "HistoryRatingDetailVC"
        static let kMyRatingPageView = "MyRatingPageView"
        static let kNotRatingVC = "NotRatingVC"
        static let kHistoryRatingVC = "HistoryRatingVC"
        static let kNewMainRatingVC = "newMainMyRatingVC"
        static let kNewCurrentRatingVC = "newCurrentRatingVC"
        static let kNewHistoryRatingVC = "newHistoryRatingVC"
        //HDI
        static let kHDIquestionAndAnswerVC = "HDIquestionAndAnswerVC"
        static let kHDIBikeInfomationVC = "HDIBikeInfomationVC"
        

        static let kLinkAccountViewController = "LinkAccountViewController"
        static let kTrafficPopupCell = "TrafficPopupCell"

        static let kHDICarInfomationVC = "HDICarInfomationVC"
        static let kHDIConfirmVC = "HDIConfirmVC"
        static let kHDIPersonalVC = "HDIPersonalVC"
        static let kHDIWebkitController = "HDIWebkitController"
        static let kHDIDetailCertificateController = "HDIDetailCertificateController"
        //6.5.2
        static let kPopupAuthenSettingController = "PopupAuthenSettingController"
        
        // IPCAMERA
        static let kIPCameraMainVC = "IPCameraMainVC"
        static let kIPCameraPackageVC = "IPCameraPackageVC"
        static let kContractVC = "ContractVC"
        static let kQuotationVC = "QuotationVC"
        static let kEContractDetailVC = "EContractDetailVC"
        static let kEContractPayMethodVC = "EContractPayMethodVC"
        static let kPopupNotificationOnlyImage = "popupOnlyImageVC"
        
        // CTV
        static let kRegisterForCTVWKVC = "registerForCTVWKVC"
        static let kCTVProfileVC = "CTVProfileVC"
        
        // BroadcastVC
   

        static let kPopupBroadcastVC = "PopupBroadcastVC"

        static let kChannelDetailVC = "ChannelDetailVC"
        static let kBroadcastSearchVC = "BroadcastSearchVC"
        static let kPopupChangeNameFptTvVC = "PopupChangeNameFptTvVC"
        static let kPopupChangePassBoxVC = "PopupChangePassBoxVC"
        static let kPopupConfirmChgPassBoxVC = "PopupConfirmChgPassBoxVC"
        static let kPopupBoxReminderVC = "PopupBoxReminderVC"
 
        static let kBroadcastOTPVC = "BroadcastOTPVC"
        static let kBroadcastChildwatchVC = "BroadcastChildwatchVC"
        static let kPopupChildwatchAgeLock = "PopupChildwatchAgeLock"
        static let kPopupChildwatchAppLock = "PopupChildwatchAppLock"
        static let kPopupChildwatchTimeLock = "PopupChildwatchTimeLock"
        //Modem
        static let kResetingModemVCIdScreen = "resetingModemVC"
        static let kNewScheduleModemVC = "scheduleModemVC"
        static let kPopupSetupScheduleVC = "popupSetupScheduleVC"
        static let kPopupModemWarningNoData = "popupModemWarningNoData"
        
        //Notification
        static let kNotiContractPopupVC = "NotiContractPopupVC"
        static let kNotificationViewController = "NotificationVC"
        static let kPopupEventForNotification = "popupEventForNotificationVC"
        static let kNotiDetailsSimpleVC = "NotiDetailsSimpleVC"

        //MARK: EventSocket
        static let kPopupCustomImageTransperant = "popupCustomImageTransperant"
        
        //ServiceInWebkit
        static let kPNCWebviewController = "PNCWebViewController"
        static let kScanQROfPNC = "ScanQRViewController"
        static let kWebkitActionEvent = "WebKitActionController"
        static let kWebkitBasicVC = "WebkitBasicViewController"
        
        static let kPopupSettingModem = "PopupSettingModem"
        static let kModemParentialControlVC = "ModemPCVC"
        
        //Payment 5.x
        static let kPaymentResultVC = "paymentResultVC"
        static let kPaymentDescVC = "PaymentDescVC"
        
        //Camera
 

        //MARK: ContractFilter
        
        //MARK: v6.2
        static let kChangeInfoContractVC = "ChangeIDController"

   
       
        static let kConfirmChangePaymentVC = "ConfirmChangePaymentVC"
        
        static let kChangeInfoContractController = "ChangeInfoContractController"

        //MARK: v6.3
        static let kTransferManagerVC = "TransferManagerVC"
        static let kEditHDIController = "EditHDIController"
        static let kAccessPointVC = "AccessPointVC"
        static let kAccessPointOTPVC = "AccessPointOTPVC"
        static let kPopupAPRestartVC = "PopupAPRestartVC"
        
        //6.1.1
        static let kWebkitEcommerceController = "WebkitEcommerceController"
        
        //Profile
        static let kUpdateProfileVC = "UpdateProfileVC"
        static let kUpdateProfileDatePickerVC = "UpdateProfileDatePickerVC"
        
        //MARK: v6.4
        static let kModemVC = "ModemController"
        static let kEContractListVC = "EContractListController"
        static let kMainDeviceVC = "mainDeviceVC"
        static let kDeviceInfoConnectedController = "deviceInfoConnectedController"
        static let kInfoConnectedController = "infoConnectedController"
        static let kDeviceInfoDetailsController = "deviceInfoDetails"
        static let kDeviceIconController = "deviceIconController"
        static let kMainAccessPointController = "mainAccessPointController"
        static let kSettingModemController = "SettingModemController"
        static let kPopupSelectRestartVC = "PopupSelectRestartVC"
        static let kDeviceRestartVC = "DeviceRestartVC"
        static let kMainWiFiAccessPointController = "mainWiFiAccessPointController"
        static let kWiFiSetupController = "wiFiSetupController"
        static let kListUseModemVC = "ListUseModemVC"
        static let kAuthenModemController = "AuthenModemController"
        static let kSetupDetailScheduleVC = "SetupDetailScheduleVC"
        static let kTrafficController = "TrafficController"
        static let kSetupContractVC = "SetupContractVC"
        static let kDetailInfoContractVC = "DetailInfoContractVC"
        static let kWiFiShareController = "WiFiShareController"
        
        
        //MARK: v6.6
        static let kFSafeAddNewUser = "FSafeAddNewUser"
        static let kEVCPopupVC = "EVCPopupVC"
        
        //MARK: v6.7
        static let kPopupChosseYearHDIVC = "popupChosseYearHDIVC"
        
        //MARK: v6.8
        static let kInsuranceFlashScreenVC = "insuranceFlashController"
        static let kInsuranceHomeVC = "insuranceHomeVC"
        static let kInsuranceVoucherVC = "insuranceVoucherVC"
        static let kInsuranceListProductsVC = "InsuranceListProductsVC"
        static let kInsuranceWebkitVC = "InsuranceWebkitVC"
        /// ChangePaymentMethod
        static let kChangePaymentMethodVC = "ChangePMVC"
        static let kChangeAddressPaymentMethodVC = "ChangePMaddressVC"
        static let kChangeChangePMconfirmVC = "ChangePMconfirmVC"
        //MARK: v7.0
       
        
    }
    //MARK: COLOR KEY
    struct ColorKey {
        static let backgroundBlue = "#1B51EF"
        static let switchBlue = "#4564ED"
        static let switchGray = "#AAAAAA"
        static let textBlack = "#323232"
        static let textOrange = "#F7963F"
        static let textRed = "#E5625C"
        static let textGreen = "#30D78B"
        static let textLightBlue = "#89A7FE"
        static let textViolet = "#8F3EFF"
        static let textOcean = "#18B3F9"
        static let textLightBlack = "#666666"
        static let bgLightGray = "#F5F5F5"
        static let bgLightOrange = "#F7963F"
        static let bgLightBlue = "#89A7FE"
        static let bgSolid = "#EEEEEE"
        static let bgSolidSettings = "#F3F6FF"
        static let bgLightSolid : UIColor = UIColor.init(red: 0.54, green: 0.65, blue: 1, alpha: 0.1)
        static let uploadOrange: UIColor = UIColor.init(red: 0.19, green: 0.84, blue: 0.55, alpha: 1)
        static let downloadGreen: UIColor = UIColor.init(red: 0.97, green: 0.59, blue: 0.25, alpha: 1)
        static let buttonRed: UIColor = UIColor.init(red: 0.9, green: 0.38, blue: 0.36, alpha: 1.0)
        static let buttonGreen: UIColor = UIColor.init(red: 0.19, green: 0.84, blue: 0.55, alpha: 1.0)
        static let buttonBlue: UIColor = UIColor.init(red: 0.27, green: 0.39, blue: 0.93, alpha: 1.0)
        static let buttonGrey = "#F5F5F5"
        static let buttonLightBlue: UIColor = UIColor.init(red: 0.27, green: 0.39, blue: 0.93, alpha: 0.5)
//        static let redBackgroundLunar = "#F53230"
//        //5.12 Long Chau
        static let LCbuttonBoldBlue = "#1435C3"
        static let LCbuttonGrey = "#595959"
        static let LCTextBlackBold = "#333333"
        static let LCTextLightGray = "#4D4D4D"
        static let LCTextBoldBlue = "#1435C3"
        //5.14
        static var ctvChartBlueColor: UIColor = 0x4564ED.toUIColor
        static var ctvChartOrangeColor: UIColor = 0xF7963F.toUIColor
        //HDI
        static let HDI_Light_Gray = "#B0B0B0"
        static let HDI_Border_Gray = "#DDDDDD"
        static let Text_Title_Popup_Black = "#2F3954"
        
    }
    
    struct KeyNameAPI {
        static let kIsShowIOS = "isShowIOS"
        static let kId = "id"
        static let kContractNo = "contractNo"
        static let kContractNos = "contractNos"
        static let kContracts = "contracts"
        static let kScreen = "screen"
        static let kShowServiceLink = "showServiceLink"
        static let kDeviceToken = "deviceToken"
        static let kPlatformiOS = "IOS"
        static let kDevicePlatform = "devicePlatform"
        static let kCurrentVersion = "currentVer"
        static let kShowServiceGuide = "showServiceGuide"
        static let kEmployeeMail = "employeeMail"
        static let kCode = "code"
        static let kContractId = "contractId"
        static let kActionType = "actionType"
        static let kKeySearch = "keySearch"
        static let kOfficeProvinceId = "officeProvinceId"
        static let kDistrictId = "districtId"
        static let kCustomerReportId = "customerReportId"
        static let kCustomerSurveyType = "customerSurveyType"
        static let kSectionTimeStart = "sectionTimeStart"
        static let kData = "data"
        static let kFromNotify = "fromNotify"
        static let kEventType = "eventType"
        static let kReportType = "reportType"
        static let kCustomerReportType = "customerReportType"
        static let kReportTypeId = "reportTypeId"
        static let kName = "name"
        static let kPhone = "phone"
        static let kRequestReport = "requestReport"
        static let kDescription = "description"
        static let kLocationProvinceId = "locationProvinceId"
        static let kLocationDistrictId = "locationDistrictId"
        static let kResultSearchOfficeLocations = "resultSearchOfficeLocations"
        static let kEmail = "email"
        static let kContent = "content"
        static let kMessage = "message"
        static let kActiveKnowAppFrom = "activeKnowAppFrom"
        static let kSession = "session"
        static let kLatitude = "latitude"
        static let kLongitude = "longitude"
        static let kStateProvinceId = "StateProvinceId"
        static let kDeviceId = "deviceId"
        static let kDeviceName = "deviceName"
        static let kFirstName = "firstName"
        static let kLastName = "lastName"
        static let kDeviceInfo = "deviceInfo"
        //LongChau
        static let kCategorySlug = "categorySlug"
        static let kIsFromHome = "isFromHome"
        static let kCategories = "categories"
        static let kProducts = "products"
        static let kTagSlug = "tagSlug"
        static let kObjectSlug = "objectSlug"
        static let kOrderId = "orderId"
        static let kPageNo = "pageNo"
        static let kProductCode = "productCode"
        static let kKeyword = "keyword"
        static let kSortType = "sortType"
        static let kCategoryId = "categoryId"
        static let kContractIds = "contractIds"
        static let kLang = "lang"
        static let kFullName = "fullName"
        static let kCustomerPhone = "customerPhone"
        static let kBirthday = "birthday"
        static let kGender = "gender"
        static let kAddress = "address"
//        static let kDeviceInfo = "deviceInfo"

        //IPCamera
        static let keyLocalTypeCamera = "FPTCamera"
        static let kEContractCode = "eContractCode"
        static let kEContractId = "eContractId"
        static let kEContract = "EContract"
        static let kModemAuthToken = "modemAuthToken"
        static let kModemAuthPassword = "modemAuthPassword"
        static let kIsActive = "isActive"
        static let kYes = "YES"
        static let kNo = "NO"
        //ver6.7
        static let kType = "type"
        //Broadcast
        static let kMac = "mac"
        static let kMacId = "macId"
        static let kCustomerId = "customerId"
        static let kNewBoxName = "newBoxName"
        static let kProgramId = "programId"
        static let kProgramName = "programName"
        static let kProgramStartTime = "programStartTime"
        static let kProgramEndTime = "programEndTime"
        static let kAddTestPayTvContracts = "addTestPayTvContracts"
        static let kProgramTime = "programTime"
        static let kSelectedTvBoxes = "selectedTvBoxes"
        static let kCustomerIdTv = "customerIdTv"
        static let kPassword = "password"
        static let kSetOverPass = "setOverPass"
        static let kConfirmPassword = "confirmPassword"
        static let kProgramLength = "programLength"
        static let kPhoneSendOtp = "phoneSendOtp"
        static let kCustomerType = "customerType"
        static let kBoxesTotalCount = "boxesTotalCount"
        static let kAgesSelectedKey = "agesSelectedKey"
        static let kOptionType = "optionType"
        static let kStatus = "status"
        static let kKey = "key"
        static let kLock = "lock"
        static let kApps = "apps"
        static let kTimeslockFrames = "timeslockFrames"
        static let kChannelId = "channelId"
        static let kChannelName = "channelName"
        static let kChannelLogoUrl = "channelLogoUrl"
        static let kMessageId = "messageId"
        static let kMessageType = "messageType"
        static let kLimit = "limit"
        static let kDateTime = "dateTime"
        
        static let kButtonAction = "buttonAction"
        static let kButtonClose = "buttonClose"
        static let kModemMac = "modemMac"
        static let kProfileId = "profileId"
        
        static let kAutopayId = "autopayId"
        static let kMethodKey = "methodKey"
        
    }
    
    struct ModemActionType {
        static let Change_Wifi_Name = "change_wifi_name"
        static let Change_Wifi_Password = "change_wifi_password"
        static let On_Wifi = "on_wifi"
        static let Off_Wifi = "off_wifi"
        static let Restart_Modem = "restart"
        static let Wifi_Schedule = "wifi_schedule"
        static let Modem_Schedule = "modem_schedule"
        static let Restart_Access_Point = "restartAP"
    }

    
    //MARK: Notification Default Center Key
    struct Notification_Default_Key {
        static let Reload_Cell_Event_Home = "NOTI_RELOAD_CELL_EVENT_HOME"
        static let Loyalty_SDK_Post = "receiveNotifyLoyalty"
        static let Loyalty_Dismiss_LeftMenu = "Loyalty_Dismiss_LeftMenu"
        static let Reload_Cell_Top_Funtion_Home = "Reload_Cell_Top_Funtion_Home"
        static let Reload_Data_Profile_Contract_Left_Menu = "Reload_Data_Profile_Contract_Left_Menu"
        static let NETWORK_STATUS = "NETWORK_STATUS"
        static let Reload_Loyalty_Info = "Reload_Loyalty_Info"
        static let ApplicationDidBecomeActive = "ApplicationDidBecomeActive"
        //7.0
        static let ReloadData_After_Create_Report = "reloadData_After_Create_Report"
        static let ReloadData_After_Cancel_Report = "reloadData_After_Cancel_Report"
        //7.5 modem
        static let ReloadData_ModemInfo_After_ChangeDeviceInfo = "ReloadData_ModemInfo_After_ChangeDeviceInfo"
    }
    
    //Notification Event
    struct Event_Type_Notification {
        static let Event_Normal = "event_normal"
        static let Normal_Not_Url = "normal_not_url"
        static let Popup_Image_Full_Screen = "popup_image_full_screen"
        static let Popup_Full_Screen = "popup_full_screen"
        static let Popup_Image_Transparent = "popup_image_transparent"
        static let Service_Link = "service_link"
        static let Referral_Code_Success = "referral_code_success"
        static let Referral_Code_Invite = "referral_code_invite"
        static let Popup_Custom_Image_Transparent = "popup_custom_image_transparent"
        static let Referral_Code_Success_2 = "referral_code_success_2"
        static let Successful_Service_Registration = "successful_service_registration"
        static let Successfully_Activated_Registration = "successfully_activated_registration"
        //6.2.2
        static let Popup_Image_With_Button_Inside = "popup_image_with_button_inside"
    }
    
    //Notification Type
    struct Notification_Type {
        static let EVENT = "EVENT"
        static let INFORMATION = "INFORMATION"
        static let REPORT = "REPORT"
        static let BILLING = "BILLING"
        static let MODEM = "MODEM"
        static let SURVEY = "SURVEY"
        static let TV = "TV"
        static let CHAT = "CHAT"
        static let LOYALTY = "LOYALTY"
        static let CANHTO = "CANHTO"
    }
    
    //MARK: 5.8 Dynamic Action Notification
    struct ButtonActionType {
        static let Go_To_Screen = "goToScreen"
        static let Call_API = "callApi"
        static let Open_URL = "openUrl"
        static let No_Action = "noAction"
        static let Show_Content = "showContent"
    }
    
    struct Go_Screen_Key {
        static let Loyalty_Home = "LOYALTY_HOME"
        static let Report_Home = "report_home"
        static let Registration_Help = "REGISTRATION_HELP"
        static let FoxPay_Home = "FOXPAY_HOME"
        static let CanhTo_Contract_Management = "CANH_TO_CONTRACT_MANAGEMENT"
        static let FSafe_Payment_Method = "FSAFE_PAYMENT_METHOD"
        static let FSafe_Events = "FSAFE_EVENTS"
        static let Hdi_Certificate = "HDI_CERTIFICATE"
        static let Hdi_Motobike = "HDI_MOTORBIKE"
        static let Hdi_Car = "HDI_CAR"
        static let VOUCHER = "VOUCHER"
        static let E_CONTRACT_QUOTATION = "E_CONTRACT_QUOTATION"
    }
    
    struct ButtonType {
        static let Auto = "auto"
        static let Normal = "normal"
    }
    
    //Notification Format
    struct Type_Format_Notification {
        static let Normal = "normal"
        static let Html = "html"
        static let htmlWebview = "htmlWebView"
    }
    
    //MARK:: 5.13 Notification Chat type
    struct Chat {
        static let ChatMessage = "chat_message"
    }
    //Support List Type - report/show-list-report-by-type
    struct Support_List_Type {
        //Technical
        static let Technical_Time = "technical_show_time"
        //Charge
        static let Charge_Time = "charge_show_time"
        static let Charge_Info = "charge_info"
        static let Charge_Change_Address = "charge_change_address"
        static let Charge_Other_Next = "other_next"
        //Procedure
        static let Procedure_Change_Address = "procedure_change_address"
        static let Procedure_Change_Info = "procedure_change_info"
        static let Procedure_Update_Service = "procedure_upgrade_package"
        static let Procedure_Change_Owner = "procedure_show_popup_change_ownership"
        static let Other = "other"
    }
    
    //Modem Type
    struct Modem_Type_Notification {
        static let Modem_Schedule = "schedule"
    }
    
    //Billing_Function
    struct Billing_Function {
        static let Current_Billing = "NOTIFICATION"
    }
    struct Schedule_Modem_Type {
        static let SUCCESS = "SUCCESS"
        static let MODEM_NOT_SUPPORT_SCHEDULE = "MODEM_NOT_SUPPORT_SCHEDULE"
        static let TURN_ON_WIFI_2_BAND = "TURN_ON_WIFI_2_BAND"
        static let TURN_ON_WIFI_1_BAND = "TURN_ON_WIFI_1_BAND"
        static let CREATE = "CREATE"
        static let UPDATE = "UPDATE"
    }
    //MARK:: 5.10 FSecure
    struct FSecure_Avatar_Image_Key {
        static let profile_image_0 = "profile_image_0"
        static let profile_image_1 = "profile_image_1"
        static let profile_image_2 = "profile_image_2"
        static let profile_image_3 = "profile_image_3"
        static let profile_image_4 = "profile_image_4"
        static let profile_image_5 = "profile_image_5"
        static let profile_image_6 = "profile_image_6"
    }
}

