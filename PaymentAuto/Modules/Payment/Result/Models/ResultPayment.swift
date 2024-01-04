//
//  ResultPayment.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import Foundation

enum ResultType {
    case success
    case fail
}

struct ResultPayment {
    let resultModel: ResultModel
    let addOnResultModel: AddOnResultModel?
}

struct ResultModel {
    let resultType: ResultType
    let title: String
    let price: String?
    let desc: String
}

struct AddOnResultModel {
    let img: String
    let title: String
    let desc: String
}
