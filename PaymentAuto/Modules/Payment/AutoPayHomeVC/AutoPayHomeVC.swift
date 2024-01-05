//
//  AutoPaymentVC.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class AutoPayHomeVC: BaseControllerWithHeaderVC {
    
    private let paymentBar: UIView = AutoPayBar()
    private let autoPayPlaceHolderView: UIView = AutoPayPlaceHolderView()
    private let autoPayDetailTblV: AutoPayContractAndMethodTblV = AutoPayContractAndMethodTblV()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        setupUI()
    }
    
    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        
        headerView.btnRightBarOPtion.isHidden = true

        
        
        let contract = Contract(contactNo: "HDN1230017", presenterName: "Nguyễn Quỳnh Anh", address: "345 Cau Giay, Quan Hoa, Cau Giay, Ha Noi")

        let autoPayDetailModel = AutopayDetailModel()
        
        autoPayDetailTblV.configure(contract: contract, autoPayDetailModel: autoPayDetailModel)
        
    }
    
    private func setupUI(){
        view.addSubViews(paymentBar,autoPayPlaceHolderView,autoPayDetailTblV)
        
        NSLayoutConstraint.activate([
            paymentBar.heightAnchor.constraint(equalToConstant: 52),
            paymentBar.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -1),
            paymentBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paymentBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            autoPayPlaceHolderView.topAnchor.constraint(equalTo: paymentBar.bottomAnchor),
            autoPayPlaceHolderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoPayPlaceHolderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            autoPayPlaceHolderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            autoPayDetailTblV.topAnchor.constraint(equalTo: paymentBar.bottomAnchor),
            autoPayDetailTblV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoPayDetailTblV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            autoPayDetailTblV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
}
