//
//  ContractItem.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import SwiftyJSON
import UIKit

class ContractItem: Equatable {
    static func == (lhs: ContractItem, rhs: ContractItem) -> Bool {
        return lhs.Contract == rhs.Contract
    }
    
    var id: String = ""
    var _type: String = ""
    var Contract: String = ""
    var CustomerIsActive: Int = 0
    var ContractType: Int = 0
    var Address: String = ""
    var LocationID: String = ""
    var Email: String = ""
    var LocalType: String = ""
    var Phone: String = ""
    var FullName: String = ""
    var IsOwnerPhone: Int = 0
    var PayTV: Int = 0
    var IsBill: Int = 0
    var hiFptContractType: String = ""
    var hiFPTCustomerType: String = ""
    var ContractTypeTitle: String = ""
    var LocalTypeFormat: String = ""
    var UploadTraffic: String = ""
    var DownloadTraffic: String = ""
    var checkEContractConfirmed: Int = 0
    var isInternet: Bool = false
    var isFptPlay: Bool = false
    var isCamera: Bool = false
    var lastTimeServiceFeedback: String = ""
    
    var objectColor: ColorModel {
        return ContractModel.colorTitleContract[colorIndex]
    }
    var colorIndex = 0
    var isChoice: Bool = false
    var isCameraContract:Bool = false
    var isConfirmed : Int = 1
    var isFsafe: Int = 0
    var customerSetContractName: String = ""
    var passport: String = ""
    var contractDefault = false
    
    
    convenience init(data: JSON, chooseContract: Bool) {
        self.init()
        self.id = data["Id"].stringValue
        self._type = data["type"].stringValue
        self.Contract = data["Contract"].stringValue
        self.CustomerIsActive = data["CustomerIsActive"].intValue
        self.ContractType = data["ContractType"].intValue
        self.Address = data["Address"].stringValue
        self.LocationID = data["LocationID"].stringValue
        self.Email = data["Email"].stringValue
        self.LocalType = data["LocalType"].stringValue
        self.Phone = data["Phone"].stringValue
        self.FullName = data["FullName"].stringValue
        self.IsOwnerPhone = data["IsOwnerPhone"].intValue
        self.PayTV = data["PayTV"].intValue
        self.IsBill = data["IsBill"].intValue
        self.hiFptContractType = data["hiFptContractType"].stringValue
        self.hiFPTCustomerType = data["hiFPTCustomerType"].stringValue
        self.ContractTypeTitle = data["ContractTypeTitle"].stringValue
        self.LocalTypeFormat = data["LocalTypeFormat"].stringValue
        self.UploadTraffic = data["Traffics"]["Upload"].stringValue
        self.DownloadTraffic = data["Traffics"]["Download"].stringValue
        self.checkEContractConfirmed = data["checkEContractConfirmed"].intValue
        self.colorIndex = 0
        self.isChoice = chooseContract
        self.isCameraContract = (data["LocalTypeFormat"].stringValue == "FPTCamera" ? true : false)
        self.isInternet = data["isInternet"].boolValue
        self.isFptPlay = data["isFptPlay"].boolValue
        self.isCamera = data["isCamera"].boolValue
        self.isConfirmed = 1
        self.isFsafe = data["IsFsafe"].intValue
        self.customerSetContractName = data["CustomerSetContractName"].stringValue
        self.lastTimeServiceFeedback = data["lastTimeServiceFeedback"].stringValue
        self.passport = data["Passport"].stringValue
        self.contractDefault = false
    }
    
//    func parseJSONcontract(json: [JSON]) -> [ContractItem] {
//        var listContract: [ContractItem] = [ContractItem]()
//        
//        var listContractActive: [ContractItem] = [ContractItem]()
//        var listContractNotActive: [ContractItem] = [ContractItem]()
//        
//        for data in json {
//            
//            if data["CustomerIsActive"].boolValue {
//                if data["Order"].intValue == 1 {
//                    listContractActive.insert(ContractItem(data: data, chooseContract: false), at: 0)
//                } else {
//                    listContractActive.append(ContractItem(data: data, chooseContract: false))
//                }
//            } else {
//                listContractNotActive.append(ContractItem(data: data, chooseContract: false))
//            }
//        }
//        //Set Color
//        for (index , contract) in listContractActive.enumerated(){
//            contract.colorIndex = index % MyGlobal.shared().colorTitleContract.count
//        }
//        listContract = listContractActive + listContractNotActive
//        return listContract
//        
//    }
    
    var hiFPTCustomerTypeEnum: CustomerType {
        switch hiFPTCustomerType {
        case "FPTCUSTOMER":
            return .FPTCUSTOMER
        case "CANHTO":
            return .CANHTO
        default:
            return .FPTCUSTOMER
        }
    }
    
    func getContractNo() -> String {
        return self.Contract
    }
}

//v5.14 CTV
enum CustomerType: String {
    case FPTCUSTOMER = "FPTCUSTOMER"
    case CANHTO  = "CANHTO"
}

struct ColorModel {
    var color: UIColor
    var img: UIImage
    var informationImg: UIImage
}
