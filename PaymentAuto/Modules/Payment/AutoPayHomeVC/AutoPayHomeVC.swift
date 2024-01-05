//
//  AutoPaymentVC.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class AutoPayHomeVC: BaseControllerWithHeaderVC {
    
    let contract = SampleData.sampleContractModel
    private var autoPayDetailModel: AutopayDetailModel? = nil
    
    private let paymentBar: UIView = AutoPayBar()
    private let autoPayPlaceHolderView: AutoPayPlaceHolderView = AutoPayPlaceHolderView()
    private var autoPayDetailTblV: AutoPayContractAndMethodTblV
    private let vFooter: HiBottomViewWithTwoButton = {
        let v = HiBottomViewWithTwoButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()


    init(autoPayDetailModel: AutopayDetailModel?) {
        self.autoPayDetailModel = autoPayDetailModel
        self.autoPayDetailTblV = AutoPayContractAndMethodTblV(contract: self.contract)

        super.init(nibName: nil, bundle: nil)
        configure(autoPayDetailModel: self.autoPayDetailModel)
    }
    
    private func configure(autoPayDetailModel: AutopayDetailModel?){
        if let autoPayDetailModel = autoPayDetailModel {
            //Case registered
            vFooter.isHidden = false
            autoPayDetailTblV.isHidden = false
        }else {
            //Case not yet register
            vFooter.isHidden = true
            autoPayDetailTblV.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        autoPayPlaceHolderView.delegate = self
        setupUI()
        setupFooter()
    }
    
    private func setActionForPrimaryButton(){
        
    }
    
    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        
        headerView.btnRightBarOPtion.isHidden = true
    
    }
    
    private func setupFooter(){
        vFooter.btnPrimary.isEnabled = true
        vFooter.btnSecondary.isEnabled = true
        vFooter.svMain.axis = .vertical
        vFooter.btnPrimary.setTitle("Xác nhận", for: .normal)
        vFooter.btnSecondary.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        vFooter.hideSecondaryButton()
        vFooter.btnSecondary.setTitle("oke", for: .normal)
    }
    

    
    private func setupUI(){
        view.addSubViews(paymentBar,autoPayPlaceHolderView,autoPayDetailTblV,vFooter)
        
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
            
            self.vFooter.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.vFooter.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.vFooter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.vFooter.heightAnchor.constraint(equalTo: self.vFooter.widthAnchor, multiplier: 80/414)
        ])
        
    }
}

extension AutoPayHomeVC: AutoPayPlaceHolderViewDelegate {
    func didPressRegister() {
        let navVC = AutoPayRegisterVC(contract: self.contract)
        self.navigationController?.pushViewController(navVC, animated: true)
        
    }
    
    
}
