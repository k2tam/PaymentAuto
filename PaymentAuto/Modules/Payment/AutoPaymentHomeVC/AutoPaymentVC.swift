//
//  AutoPaymentVC.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class AutoPaymentVC: UIViewController {
    
    private let paymentBar: UIView = AutoPaymentBar()
    private let autoPaymentPlaceHolderView: UIView = AutoPaymentPlaceHolderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        setupUI()
    }
    
    private func setupUI(){
        view.addSubViews(paymentBar,autoPaymentPlaceHolderView)
        
        NSLayoutConstraint.activate([
            paymentBar.heightAnchor.constraint(equalToConstant: 52),
            paymentBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paymentBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paymentBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            autoPaymentPlaceHolderView.topAnchor.constraint(equalTo: paymentBar.bottomAnchor),
            autoPaymentPlaceHolderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoPaymentPlaceHolderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            autoPaymentPlaceHolderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}
