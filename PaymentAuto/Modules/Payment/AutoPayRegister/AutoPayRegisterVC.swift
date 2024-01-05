//
//  PaymentAutoRegister.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class AutoPayRegisterVC: BaseControllerWithHeaderVC {
    private var vm = PaymentAutoRegisterVM()
    
    private let autoPayDetailTblV: AutoPayContractAndMethodTblV
    var indexPathOfPayMethodCell: IndexPath? = nil
    
    private let vFooter: HiBottomViewWithTwoButton = {
        let v = HiBottomViewWithTwoButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Đăng ký trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        
        headerView.btnRightBarOPtion.isHidden = true
    }
  
    init(contract: Contract){
        self.autoPayDetailTblV = AutoPayContractAndMethodTblV(contract: contract)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupFooter()
        setActionForApplyButton()
        
    }
    
    private func setupUI(){
        view.addSubViews(autoPayDetailTblV,vFooter)
        
        NSLayoutConstraint.activate([
            autoPayDetailTblV.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            autoPayDetailTblV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoPayDetailTblV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            autoPayDetailTblV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.vFooter.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.vFooter.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.vFooter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.vFooter.heightAnchor.constraint(equalTo: self.vFooter.widthAnchor, multiplier: 80/414)
        ])
    }
    
    
    //TODO: Handle when select payment method
    func toggleSelectMethodSheet() {
        
        //TODO: Set data and update UI for showing selected payment method
        autoPayDetailTblV.setDataAutoPayDetailModel(autoPayDetailModel: SampleData.sampleAutoPayModel)
    }
}

extension AutoPayRegisterVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tblItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch vm.tblItems[indexPath.row] {
        case .contractInfo(let contract):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractTblCell.cellId, for: indexPath) as? ContractTblCell else {
                return UITableViewCell()
            }
            cell.configure(from: contract)
            return cell
        case .payment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AutoPaymentMethodTblCell.cellId, for: indexPath) as? AutoPaymentMethodTblCell else {
                return UITableViewCell()
            }
            self.indexPathOfPayMethodCell = indexPath
            cell.configure(from: nil)
            cell.didTapSelectMethod = toggleSelectMethodSheet
            
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
}
extension AutoPayRegisterVC{
    func setupFooter(){
        vFooter.btnPrimary.isEnabled = true
        vFooter.btnPrimary.setTitle("Xác nhận", for: .normal)
        vFooter.btnSecondary.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        vFooter.hideSecondaryButton()
        vFooter.btnSecondary.setTitle("oke", for: .normal)
        
    }
    
    private func setActionForApplyButton() {
        vFooter.btnPrimary.addTarget(self, action: #selector(didPressApplyButton), for: .touchUpInside)
    }
    
    @objc func didPressApplyButton() {
        let checkFeeVoucherModel = ResultManager.getResultPaymentData()
        let resultVC = ResultVC(modelPayment: checkFeeVoucherModel!, typeResult: .SUCCESS)
        
        navigationController?.pushViewController(resultVC, animated: true)
    }
}



