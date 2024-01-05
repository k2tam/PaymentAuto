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

    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        
        headerView.btnRightBarOPtion.isHidden = true
    }

    private let vDividerLine = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#E7E7E7")
        return view
    }()
    
  
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
        
    }
    
    private func setupUI(){
        view.addSubview(autoPayDetailTblV)
        
        NSLayoutConstraint.activate([
            autoPayDetailTblV.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            autoPayDetailTblV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            autoPayDetailTblV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            autoPayDetailTblV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func toggleSelectMethodSheet() {
//        autoPayDetailTblV.setDataAutoPayDetailModel(autoPayDetailModel: AutopayDetailModel)
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
            cell.configure(from: nil)
            cell.didTapSelectMethod = toggleSelectMethodSheet
            
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//    }
    
    
}



