//
//  ResultService.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import Foundation
import SwiftyJSON


struct ResultManager {
    public static var shared = ResultManager()
    
    public static func getResultPaymentData() -> CheckFreeVoucherModel?{
            guard let data = ResultSampleData.sampleData.data(using: .utf8) else {
                return nil
            }
            
            if let json = try? JSON(data: data){
                return CheckFreeVoucherModel(json: json["data"])
            }
            
            return nil
    }
}
