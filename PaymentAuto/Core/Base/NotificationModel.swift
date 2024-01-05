//
//  NotificationModel.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import SwiftyJSON
import RealmSwift
import Foundation

class NotificationModel: Object {
    
    @Persisted(primaryKey: true)var id:String = ""
    @Persisted var message:String = ""
    @Persisted var createDate:String = ""
    @Persisted var dateCreated:Date = Date()
    @Persisted var type:String = ""
    @Persisted var title:String = ""
    @Persisted var isReadDetail:Int = 0
    @Persisted var contractId:String = ""
    @Persisted var contractNo:String = ""
    @Persisted var customerReportId:String = ""
    @Persisted var billNumber:String = ""
    @Persisted var image:String = ""
    @Persisted var eventType:String = ""
    @Persisted var domain:String = ""
    @Persisted var eventUrl:String = ""
    @Persisted var loyaltyStatus:String = ""
    @Persisted var target:String = ""
    @Persisted var typeFormat:String = ""
    @Persisted var customerSurveyType:String = ""
    @Persisted var saveInApp: String = ""
    @Persisted var isPinMessage: Bool = false
    
    @Persisted var wifiName: String = ""
    @Persisted var password: String = ""
    @Persisted var localType: String  = ""
    @Persisted var downloadSpeed: String  = ""
    @Persisted var uploadSpeed: String  = ""
    @Persisted var startDate: String  = ""
    @Persisted var endDate: String  = ""
    @Persisted var monthlyCost: String  = ""
    @Persisted var startBillDate: String = ""
    @Persisted var promotionText: String = ""
    
    //NEW BILLING
    @Persisted var function: String = ""
    //NEW Survey
    @Persisted var contractAddress: String = ""
    //NEW schedule modem
    @Persisted var modemMessageType: String = ""
    @Persisted var apMac: String = "" //6.3
    //MARK 5.7 Dynamic Text - Action
    @Persisted var buttonType: String = ""
    @Persisted var buttonCloseContent: String = ""
    @Persisted var buttonActionContent: String = ""
    @Persisted var buttonActionType: String = ""
    @Persisted var buttonActionKey: String = ""
    @Persisted var buttonCloseType: String = ""
    @Persisted var buttonCloseKey: String = ""
    @Persisted var data: String = ""
    //5.8
    @Persisted var typeNotiReport: String = ""
    @Persisted var idRpa: String = ""
    //6.2
    @Persisted var buttonCloseRedirect: LocalBannerModel?
    @Persisted var buttonActionRedirect: LocalBannerModel?
    //6.3.1
    @Persisted var mediaType: String = ""
    @Persisted var mediaUrl: String = ""
    @Persisted var mediaThumbImageUrl: String = ""
    @Persisted var messageTemplateId: String = ""
    
    convenience init(data: JSON) {
        self.init()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//"HH:mm:ss dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "es_MX_POSIX")
        
        self.id = data["id"].stringValue
        self.message = data["message"].stringValue
        self.createDate = data["createDate"].stringValue
        
        self.dateCreated = dateFormatter.date(from:  data["dateCreated"].stringValue) ?? Date()
           
        self.type = data["type"].stringValue
        self.title = data["title"].stringValue
        self.isReadDetail = data["isReadDetail"].intValue
        self.contractId = data["contractId"].stringValue
        self.contractNo = data["contractNo"].stringValue
        self.customerReportId = data["customerReportId"].stringValue
        self.billNumber = data["billNumber"].stringValue
        self.image = data["image"].stringValue
        self.eventType = data["eventType"].stringValue
        self.domain = data["domain"].stringValue
        self.eventUrl = data["eventUrl"].stringValue
        self.loyaltyStatus = data["loyaltyStatus"].stringValue
        self.target = data["target"].stringValue
        self.typeFormat = data["typeFormat"].stringValue
        self.customerSurveyType = data["customerSurveyType"].stringValue
        self.saveInApp = data["saveInApp"].stringValue
        self.isPinMessage = data["isPinMessage"].boolValue
        
        self.wifiName = data["wifiName"].stringValue
        self.password = data["password"].stringValue
        self.localType  = data["localType"].stringValue
        self.downloadSpeed  = data["downloadSpeed"].stringValue
        self.uploadSpeed  = data["uploadSpeed"].stringValue
        self.startDate  = data["startDate"].stringValue
        self.endDate  = data["endDate"].stringValue
        self.monthlyCost  = data["monthlyCost"].stringValue
        self.startBillDate = data["startBillDate"].stringValue
        self.promotionText = data["promotionText"].stringValue
        
        //NEW BILLING
        self.function = data["function"].stringValue
        //NEW Survey
        self.contractAddress = data["contractAddress"].stringValue
        //NEW schedule modem
        self.modemMessageType = data["modemMessageType"].stringValue
        //MARK 5.7 Dynamic Text - Action
        self.buttonType = data["buttonType"].stringValue
        self.buttonCloseContent = data["buttonCloseContent"].stringValue
        self.buttonActionContent = data["buttonActionContent"].stringValue
        self.buttonActionType = data["buttonActionType"].stringValue
        self.buttonActionKey = data["buttonActionKey"].stringValue
        self.buttonCloseType = data["buttonCloseType"].stringValue
        self.buttonCloseKey = data["buttonCloseKey"].stringValue
        self.data = data["data"].stringValue
        //5.8
        self.typeNotiReport = data["typeNotiReport"].stringValue
        self.idRpa = data["idRpa"].stringValue
        //6.2
        
        self.buttonCloseRedirect = LocalBannerModel.parseData(jsonStr: data["buttonCloseRedirect"].stringValue)
        self.buttonActionRedirect = LocalBannerModel.parseData(jsonStr: data["buttonActionRedirect"].stringValue)
        
        //6.3
        self.apMac = data["apMac"].stringValue
        //6.3.1
        self.mediaType = data["mediaType"].stringValue
        self.mediaUrl = data["mediaUrl"].stringValue
        self.mediaThumbImageUrl = data["mediaThumbImageUrl"].stringValue
        self.messageTemplateId = data["messageTemplateId"].stringValue
    }
    
    func parseDatafromJson(json: JSON) -> [NotificationModel] {
        var listNoti: [NotificationModel] = [NotificationModel]()
        //Parse data Active Contract
        if (json.arrayValue.count > 0) {
                for noti in json.arrayValue {
                    listNoti.append(NotificationModel(data: noti))
                }
        }
        
        return listNoti
    }
    
}


