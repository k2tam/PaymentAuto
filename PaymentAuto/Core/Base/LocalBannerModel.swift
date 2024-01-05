//
//  LocalBannerModel.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import SwiftyJSON
import RealmSwift

class LocalBannerModel: Object {
    @Persisted(primaryKey: true)var _id: ObjectId

    @Persisted var actionType:String = ""
    @Persisted var dataAction:String = ""
    @Persisted var data: String = "" //JSON

    convenience init(data: JSON) {
        self.init()
        self.actionType = data["actionType"].stringValue
        self.dataAction = data["dataAction"].stringValue
        self.data = data["data"].rawString() ?? ""
    }
    
    static func parseData(jsonStr: String) -> LocalBannerModel? {
        //TODO: --QuocL
        if jsonStr == "" {
            return nil
        } else {
            let initModel = LocalBannerModel(data: JSON.init(parseJSON: jsonStr))
            return initModel
        }
        
    }
}
