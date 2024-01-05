//
//  BaseViewModel.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
class BaseViewModel<T>:NSObject{
    var items : [T] = [T]()
    var baseCallbackReloadData :(()->())?
    
    deinit {
        debugPrint("---------------\(String(describing: type(of: self))) disposed-------------")
    }
    func setDataItems(data : [T]){
        self.items = data
        self.baseCallbackReloadData?()
    }
    func numberOfItem() -> Int{
        return items.count
    }
    func itemAt(index: Int)->T?{
        guard index <= numberOfItem() - 1 else {return nil}
        return items[index]
    }
}
