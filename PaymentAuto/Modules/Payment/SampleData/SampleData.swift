//
//  SampleData.swift
//  PaymentAuto
//
//  Created by k2 tam on 05/01/2024.
//

import Foundation


struct SampleData {
    static let shared = SampleData()
    
    private init() {}
    
    static let sampleContractModel = Contract(contactNo: "HDN1230017", presenterName: "Nguyễn Quỳnh Anh", address: "345 Cau Giay, Quan Hoa, Cau Giay, Ha Noi")
    
    static let sampleAutoPayModel =  AutopayDetailModel()
}
