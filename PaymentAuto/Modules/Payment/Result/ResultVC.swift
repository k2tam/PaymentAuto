//
//  ViewController.swift
//  ResultScreen
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class ResultVC: BaseControllerWithHeaderVC {
    private let tblViewResult =  UITableView()
    
    lazy var scrollView : VList = VList(
        scrollviewContentInset: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
        containerContentInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    )
    
    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Đăng ký trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        
        headerView.btnRightBarOPtion.isHidden = true
    }
    private let vFooter: HiBottomViewWithTwoButton = {
        let v = HiBottomViewWithTwoButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let resultView: ResultView
    
    //TODO: Handle result add on view button here
    private let resultAddOnView = ResultAddOnView {
        print("Press")
    }
    
    init(modelPayment: CheckFreeVoucherModel, typeResult: PaymentResultStatus = .SUCCESS_WITHOUT_PAYMENTMETHOD){
        
        self.resultView = ResultView(
            amountText: modelPayment.amountText,
            content: modelPayment.content,
            typeResult: typeResult
        )
        super.init(nibName: nil, bundle: nil)
        self.setupFooter(typeResult: .FAILURE)
        
        
    }
    
    private func configure(from resultPayment: ResultPayment){
        
        //If have add on then show if not hide
        if let addOnResultModel =  resultPayment.addOnResultModel{
            resultAddOnView.isHidden = false
            resultAddOnView.configure(from: addOnResultModel)
        }else {
            resultAddOnView.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        setupUI()
    }
    
    
    
    private func setupUI() {
        view.addSubViews(scrollView,vFooter)
        
        scrollView.vStack.spacing = 16
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addItemView(items: [resultView])
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.vFooter.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.vFooter.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.vFooter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.vFooter.heightAnchor.constraint(equalTo: self.vFooter.widthAnchor, multiplier: 80/414)
        ])
        
    }
}

extension ResultVC {
    func setupFooter(typeResult: PaymentResultStatus){
        
        vFooter.btnPrimary.isEnabled = true
        vFooter.btnSecondary.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        vFooter.hideSecondaryButton()
        vFooter.btnSecondary.setTitle("oke", for: .normal)
        
        var titleBtnPrimary: String = ""
        switch typeResult {
        case .SUCCESS:
            titleBtnPrimary = "Xem chi tiết"
            vFooter.btnPrimary.addTarget(self, action: #selector(didTapMoreDetail), for: .touchUpInside)

        case .SUCCESSAUTOPAY:
            titleBtnPrimary = "Xem chi tiết"
            vFooter.btnPrimary.addTarget(self, action: #selector(didTapFailBtn), for: .touchUpInside)
        case .FAILURE:
            titleBtnPrimary = "Thử lại"
            vFooter.btnPrimary.addTarget(self, action: #selector(didTapMoreDetail), for: .touchUpInside)
        case .SUCCESS_WITHOUT_PAYMENTMETHOD:
            titleBtnPrimary = "Xem chi tiết"
            vFooter.btnPrimary.addTarget(self, action: #selector(didTapMoreDetail), for: .touchUpInside)

        }
        
        vFooter.btnPrimary.setTitle(titleBtnPrimary, for: .normal)

    }
    
    @objc func didTapFailBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //TODO: Handle tap "Xem chi tiết khi đăng ký thành công"
    @objc func didTapMoreDetail() {
        
    }
}



