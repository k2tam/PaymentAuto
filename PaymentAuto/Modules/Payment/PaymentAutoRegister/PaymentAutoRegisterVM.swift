//
//  PaymentAutoRegisterVM.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import Foundation

struct Contract {
    let contactNo: String
    let presenterName: String
    let address: String
}

struct PaymentMethod {
    
}

enum tblItems {
    case contractInfo(Contract)
    case payment
}

class PaymentAutoRegisterVM {
    
    let sampleContract = Contract(contactNo: "HDN123001", presenterName: "Nguyễn Quỳnh Anh", address: "345 Cau Giay, Quan Hoa, Cau Giay, Ha Noi")
    
    let tblItems: [tblItems] = [
        .contractInfo(Contract(contactNo: "HDN123001", presenterName: "Nguyễn Quỳnh Anh", address: "345 Cau Giay, Quan Hoa, Cau Giay, Ha Noi")),
        .payment
    ]
    
    
}
