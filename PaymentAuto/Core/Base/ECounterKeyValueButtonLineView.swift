//
//  ECounterKeyValueButtonLineView.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//


import Foundation
import SwiftyJSON

struct ECounterContractModel{
    var icon : String
    var menuTitle :  String
    var contractID :  String
    var contractNo :  String
    var contractName :  String
    var contractPhone :  String
    var contractEmail : String
    var contractAddress :  String
    var items : [ObjectNeedChangeModel]
    var isSeclected : Bool = false
    
    init(json:JSON){
        icon = json["icon"].stringValue
        menuTitle = json["menuTitle"].stringValue
        contractID = json["contractID"].stringValue
        contractNo = json["contractNo"].stringValue
        contractName = json["contractName"].stringValue
        contractEmail = json["contractEmail"].stringValue
        contractPhone = json["contractPhone"].stringValue
        contractAddress = json["contractAddress"].stringValue
        
        var temp : [ObjectNeedChangeModel] = []
        for item in json["items"].arrayValue {
            temp.append(ObjectNeedChangeModel(json: item))
        }
        items = temp
    }
    
    static func parseFromContractItem(input: ContractItem)->ECounterContractModel{
        return ECounterContractModel(icon: "", menuTitle: "", contractID: input.id, contractNo: input.Contract, contractName: input.FullName, contractPhone: input.Phone, contractEmail: input.Email, contractAddress: input.Address, items: [])
    }
   
    init(icon : String, menuTitle :  String,contractID :  String, contractNo :  String,contractName :  String,contractPhone :  String,contractEmail :  String,contractAddress :  String,items : [ObjectNeedChangeModel],isSeclected : Bool = false) {
        self.icon = icon
        self.menuTitle = menuTitle
        self.contractID = contractID
        self.contractNo = contractNo
        self.contractName = contractName
        self.contractPhone = contractPhone
        self.contractAddress = contractAddress
        self.items = items
        self.isSeclected = isSeclected
        self.contractEmail = contractEmail
    }
}
protocol ImageTitleButton{
    var icon : String { get set }
    var title : String { get set }
    var btnImage : String { get set }
}
struct ObjectNeedChangeModel: ImageTitleButton{
    var icon: String //image
    var title: String //buttonName
    var btnImage: String
    var isSelected : Bool = false
    var actionUrl: ObjectNeedChangeType
    var description:String
    var options: [ObjectNeedChangeSubOption]
    init(json:JSON){
        icon = json["image"].stringValue  //image
        title = json["buttonName"].stringValue  //buttonName
        btnImage = json["btnImage"].stringValue
        isSelected = json["isSelected"].boolValue
        actionUrl = ObjectNeedChangeType.init(rawValue: json["actionUrl"].stringValue ) ?? .none
        description = json["description"].stringValue
        var temp : [ObjectNeedChangeSubOption] = []
        for option in json["options"].arrayValue {
            //temp.append(ObjectNeedChangeSubOption(json: option))
        }
        options = temp
    }

}

protocol KeyValueProtocol{
    var key : String { get }
    var value : String { get }
    var isChecked : Bool { get }
}
struct ECounterKeyValueButtonLineView : KeyValueProtocol{
    var key: String
    var value: String
    var dataType : DetailItemType = .text
    var isShowButton : Bool = false
    var isShowLineView: Bool = true
    var actionButtonType: ECounterKeyValueButtonLineAction = .back_view
//    var streetData: StreetInfoModel?
    var isChecked = false
    //UpgradeInternetPackage
    var typePackage: String = ""
    var descriptionPackage: String = ""
}
enum ECounterKeyValueButtonLineAction: String{
    case back_view = "back_view"
}
struct ObjectNeedChangeSubOption : KeyValueProtocol{
    var key: String
    
    var value: String
    
    var isChecked: Bool
    
    
}
enum TypeFeature: String{
    case changePhone, changeEmail, changePaymentType/*Thay đổi hình thức thanh toán*/, changeLocation, changeLocalType
    case changeCCCDCMND = "changeCMND"
    case makeAnApointment // ko su dung de tao CR
    case upgradeInternetPackage = "upgradePackage" // NhungNTT47 upgrade internetpackage
    case none  // ko su dung de tao CR
}

enum ObjectNeedChangeSubOptionType :String{
    case changePhone = "changePhone"
    case changeEmail = "changeEmail"
    case changeCCCDCMND = "changeCCCDCMND"
    case newLocationNetwork = "newLocationNetwork"
    case changeLocationModemInHouse = "changeLocationModemInHouse"
    case makeAppointment = "makeAppointment"// dat lich hen
    case historyTransaction = "historyTransaction"
    case upgradeInternetPackage = "upgradePackage" // NhungNTT47 upgrade internetpackage
    case needFullContract = "needFullContract"
    func parseToTypeFeature() -> TypeFeature{
        switch self {
        case .changePhone:
            return TypeFeature.changePhone
        case .changeEmail:
            return TypeFeature.changeEmail
        case .changeCCCDCMND:
            return TypeFeature.changeCCCDCMND
        case .newLocationNetwork:
            return TypeFeature.changeLocation
        case .changeLocationModemInHouse:
            return TypeFeature.changeLocation
        case .makeAppointment:
            return TypeFeature.makeAnApointment
        case .historyTransaction:
            return TypeFeature.none
        case .upgradeInternetPackage: // NhungNTT47 upgrade internetpackage
            return TypeFeature.upgradeInternetPackage
        case .needFullContract:
            return TypeFeature.none
        }
    }
}
enum ObjectNeedChangeType: String{
    case ECOUNTER_CHANGE_INFORMATION_REGISTERD = "ECOUNTER_CHANGE_INFORMATION_REGISTERD"
    case ECOUNTER_CHANGE_LOCATION_USE_INTERNET = "ECOUNTER_CHANGE_LOCATION_USE_INTERNET"
    case ECOUNTER_CHANGE_PAYMENT_METHOD = "ECOUNTER_CHANGE_PAYMENT_METHOD"
    case ECOUNTER_CHANGE_CHARGE_ADDRESS = "ECOUNTER_CHANGE_CHARGE_ADDRESS"
    case none = ""
}

struct ECounterCheckContractModel{
    var isChangeable : Bool
    var errorMsg : String
    var isWaitingVerifyEmail : Bool?
    var ocrOption : [ECounterOptionOCRModel]
    init(json : JSON) {
        isChangeable = json["isOK"].boolValue
        errorMsg = json["errorMsg"].stringValue
        isWaitingVerifyEmail = json["isWaitingVerifyEmail"].bool
        var temp = [ECounterOptionOCRModel]()
        for item in json["options"].arrayValue{
            temp.append(ECounterOptionOCRModel(json: item))
        }
        ocrOption = temp
    }
}
struct ECounterOptionOCRModel{
    var actionUrl : TypeOCR
    var buttonName : String
    var description : String
    var image : String
    init(json:JSON){
        actionUrl = TypeOCR.init(rawValue: json["actionUrl"].stringValue) ?? .none
        buttonName = json["buttonName"].stringValue
        description = json["description"].stringValue
        image = json["image"].stringValue
        
    }
    init(){
        actionUrl = .ECOUNTER_PASSPORT
        buttonName = "PASSPORT"
        description = ""
        image = ""
    }
}
enum TypeOCR : String{
    case ECOUNTER_CMND_CCCD
    case ECOUNTER_PASSPORT
    case none
}

struct ECounterSendOTPModel{
    var isSent : Bool
    var errorMsg : String
    init(json : JSON) {
        isSent = json["isSent"].boolValue
        errorMsg = json["errorMsg"].stringValue
    }
}
struct ECounterConfirmResultModel{
    var dataReturn : ECounterDataReturn
    var dataNSCR : ECounterDataNSCR
    // dat lich hen
    var title: String = ""
    var content: String = ""
    var transactionName: String = ""
    var timeZoneName: String = ""
    var officeName: String = ""
    //
    init(jsonMakeAppointment:JSON){
        dataReturn = ECounterDataReturn(jsonPhoneOTP: jsonMakeAppointment["dataReturn"]) // not use
        dataNSCR = ECounterDataNSCR(json: jsonMakeAppointment["dataNSCR"]) // not use
        
        title = jsonMakeAppointment["title"].stringValue
        content = jsonMakeAppointment["content"].stringValue
        transactionName = jsonMakeAppointment["transactionName"].stringValue
        timeZoneName = jsonMakeAppointment["timeZoneName"].stringValue
        officeName = jsonMakeAppointment["officeName"].stringValue
    }
    init(jsonPhoneOTP : JSON) {
        dataReturn = ECounterDataReturn(jsonPhoneOTP: jsonPhoneOTP["dataReturn"])
        dataNSCR = ECounterDataNSCR(json: jsonPhoneOTP["dataNSCR"])
        
    }
    init(jsonChangeCardID : JSON) {
        dataReturn = ECounterDataReturn(jsonChangeCardID: jsonChangeCardID["dataReturn"])
        dataNSCR = ECounterDataNSCR(json: jsonChangeCardID["dataNSCR"])
    }
}
struct ECounterDataReturn{ //dataReturn
    var phoneNumber :  String
    var transactionType : Int
    var contractNo :  String
    var transactionId :  String
    var isConfirm : Bool
    var objectID :  String
    var timeCreated :  String
    var errorMsg :  String
    var eContractCode : String
    var eContractID : String
    init(jsonPhoneOTP : JSON) {
        phoneNumber = jsonPhoneOTP["phoneNumber"].stringValue
        transactionType = jsonPhoneOTP["transactionType"].intValue//ConfirmOTPTransactionType.init(rawValue: json["transactionType"].intValue)
        contractNo = jsonPhoneOTP["contractNo"].stringValue
        transactionId = jsonPhoneOTP["transactionId"].stringValue
        isConfirm = jsonPhoneOTP["isConfirm"].boolValue
        objectID = jsonPhoneOTP["objectID"].stringValue
        timeCreated = jsonPhoneOTP["timeCreated"].stringValue
        errorMsg = jsonPhoneOTP["errorMsg"].stringValue
        eContractCode = jsonPhoneOTP["eContractCode"].stringValue
        eContractID = jsonPhoneOTP["eContractID"].stringValue
        
    }
    init(jsonChangeCardID : JSON){
        phoneNumber = jsonChangeCardID["phoneNumber"].stringValue
        transactionType = jsonChangeCardID["transactionType"].intValue
        contractNo = jsonChangeCardID["contractNo"].stringValue
        transactionId = jsonChangeCardID["transactionId"].stringValue
        isConfirm = jsonChangeCardID["isOK"].boolValue
        objectID = jsonChangeCardID["objectID"].stringValue
        timeCreated = jsonChangeCardID["timeCreated"].stringValue
        errorMsg = jsonChangeCardID["errorMsg"].stringValue
        eContractCode = jsonChangeCardID["eContractCode"].stringValue
        eContractID = jsonChangeCardID["eContractID"].stringValue
        //
        
    }
    
    init(transactionId: String, transactionType: Int, objectId: String, eContractID: String, eContractCode: String) {
        self.transactionId = transactionId
        self.transactionType = transactionType
        self.objectID = objectId
        self.eContractCode = eContractCode
        self.eContractID = eContractID
        self.contractNo = ""
        self.phoneNumber = ""
        self.isConfirm = false
        self.timeCreated = ""
        self.errorMsg = ""
    }
}

struct ECounterDataNSCR{ //dataNSCR
    var imageUrl : String
    var title : String
    var content : String
    var subContent : String
    init(json : JSON) {
        imageUrl = json["image"].stringValue
        title = json["notification"].stringValue
        content = json["textHead"].stringValue
        subContent = json["textFooter"].stringValue
    }
}

struct ECounterCheckOCRResponseModel{
    var isChangeable : ECounterCheckOCRIsMatch
    var errorMsg : String
    var codeOcr : String
    init(json : JSON) {
        isChangeable = ECounterCheckOCRIsMatch.init(rawValue: json["isOK"].intValue) ?? .NotMatch
        errorMsg = json["errorMsg"].stringValue
        codeOcr = json["codeOcr"].stringValue
    }
}
enum ECounterCheckOCRIsMatch: Int{
    case MatchBoth = 0
    case NotMatch = 1
    case MatchNameNotMatchID = 2
    case TwoSidesAreNotTheSameType = 3
    //fake
//    case MatchBoth = 1
//    case NotMatch = 0
//    case MatchNameNotMatchID = 2
//    case MatchBoth = 2
//    case NotMatch = 0
//    case MatchNameNotMatchID = 1
}

