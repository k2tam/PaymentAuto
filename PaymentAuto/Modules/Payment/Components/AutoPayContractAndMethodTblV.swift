//
//  AutoPayContractAndMethodTblV.swift
//  PaymentAuto
//
//  Created by k2 tam on 05/01/2024.
//

import UIKit
enum eTblItems {
    case contractInfo(Contract)
    case payment(AutopayDetailModel?)
}

class AutoPayContractAndMethodTblV: UIView {
    
    private var contractModel: Contract
    private var tblItems: [eTblItems] = []

    private var tblView: UITableView = {
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.backgroundColor = UIColor(hex: "#F5F5F5")
        tblView.separatorStyle = .none
        tblView.register(ContractTblCell.self, forCellReuseIdentifier: ContractTblCell.cellId)
        tblView.register(AutoPaymentMethodTblCell.self, forCellReuseIdentifier: AutoPaymentMethodTblCell.cellId)
        return tblView
    }()
    
    init(contract: Contract,autoPayDetailModel: AutopayDetailModel? = nil){
        self.contractModel = contract
        self.tblItems = [.contractInfo(contract),.payment(nil)]
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupTbl()
        setupUI()
    }
    
    
    public func setDataAutoPayDetailModel(autoPayDetailModel: AutopayDetailModel){
        self.tblItems = [.contractInfo(self.contractModel),.payment(autoPayDetailModel)]
        self.tblView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTbl() {
        tblView.delegate = self
        tblView.dataSource = self
    }
    
  
    
    private func setupUI() {
        self.addSubview(tblView)
        
        NSLayoutConstraint.activate([
            tblView.topAnchor.constraint(equalTo: self.topAnchor),
            tblView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tblView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tblView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func toggleSelectMethodSheet() {
        print("Select method sheet on")
    }
    
}

extension AutoPayContractAndMethodTblV: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tblItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.tblItems[indexPath.row] {
        case .contractInfo(let contract):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractTblCell.cellId, for: indexPath) as? ContractTblCell else {
                return UITableViewCell()
            }
            cell.configure(from: contract)
            return cell
        case .payment(let autoPaymentModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AutoPaymentMethodTblCell.cellId, for: indexPath) as? AutoPaymentMethodTblCell else {
                return UITableViewCell()
            }
            cell.configure(from: autoPaymentModel)
            cell.didTapSelectMethod = toggleSelectMethodSheet
            
            
            return cell
            
        
        }
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
    
    
}
