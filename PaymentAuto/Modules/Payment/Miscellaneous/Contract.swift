//
//  Contract.swift
//  HiFPTPaymentSDK
//
//  Created by GiaNH3 on 8/2/21.
//

import UIKit

public struct HiPaymentContract: Equatable {
    public static func == (lhs: HiPaymentContract, rhs: HiPaymentContract) -> Bool {
        return lhs.contractNo == rhs.contractNo
    }
    
    var contractNo: String = ""
    var contractId: String = ""
    var address: String = ""
    var phone: String = ""
    var isBill:Bool = false
    var objectColor: UIColor = .blue
    var informationImg: UIImage = UIImage()
    var img: UIImage = UIImage()
    var hiFPTCustomerType: String = ""
    var hiFptContractType: String = ""
    
    public init(contractNo: String, contractId: String, address: String, phone: String, isBill: Bool, objectColor: UIColor, informationImg: UIImage, img: UIImage, hiFPTCustomerType: String, hiFptContractType: String){
        self.contractNo = contractNo
        self.contractId = contractId
        self.address = address
        self.phone = phone
        self.isBill = isBill
        self.objectColor = objectColor
        self.informationImg = informationImg
        self.img = img
        self.hiFPTCustomerType = hiFPTCustomerType
        self.hiFptContractType = hiFptContractType
    }
}
