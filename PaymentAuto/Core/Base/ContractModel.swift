//
//  ContractModel.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import SwiftyJSON
import RealmSwift
import UIKit

class ContractModel: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var totalContracts: Int = 0
    var listContract: [ContractItem] = []

    convenience init(data: JSON) {
        self.init()
        self.totalContracts = data["totalContracts"].intValue
        self.listContract = parseContractItem(json: data["contracts"].arrayValue)
    }
    
    func parseContractItem(json: [JSON]) -> [ContractItem] {
        var listContract: [ContractItem] = json.map { itemJS in
            return ContractItem(data: itemJS, chooseContract: false)
        }
        
        //Set Color
        var indexColor = 0
        for contract in listContract {
            if contract.CustomerIsActive == 1 {
                contract.colorIndex = indexColor
                if indexColor < ContractModel.colorTitleContract.count - 1 {
                    indexColor += 1
                } else {
                    indexColor = 0
                }
            }
        }
        
        return listContract
    }
    
    static let colorTitleContract: [ColorModel] = [
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.switchBlue), img: UIImage(named: "ic-shape-More24-primary")!, informationImg: UIImage(named: "ic-shape-info16-primary")!),
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textOrange), img: UIImage(named: "ic-shape-More24-orange")!, informationImg: UIImage(named: "ic-shape-info16-orange")!),
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textGreen), img: UIImage(named: "ic-shape-More24-green")!, informationImg: UIImage(named: "ic-shape-info16-green")!),
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textLightBlue), img: UIImage(named: "ic-shape-More24-blue")!, informationImg: UIImage(named: "ic-shape-info16-blue")!),
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textRed), img: UIImage(named: "ic-shape-More24-red")!, informationImg: UIImage(named: "ic-shape-info16-red")!),
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textViolet), img: UIImage(named: "ic-shape-More24-violet")!, informationImg: UIImage(named: "ic-shape-info16-violet")!),
        ColorModel(color: UIColor().hexStringToUIColor(hex: Constants.ColorKey.textOcean), img: UIImage(named: "ic-shape-More24-ocean")!, informationImg: UIImage(named: "ic-shape-info16-ocean")!)
    ]

}
