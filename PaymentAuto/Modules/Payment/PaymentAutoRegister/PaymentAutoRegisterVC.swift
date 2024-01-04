//
//  PaymentAutoRegister.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class PaymentAutoRegisterVC: UIViewController {
    
    private let tblView: UITableView = {
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.backgroundColor = UIColor(hex: "#F5F5F5")
        tblView.separatorStyle = .none
        tblView.register(ContractTblCell.self, forCellReuseIdentifier: ContractTblCell.cellId)
        tblView.register(AutoPaymentMethodTblCell.self, forCellReuseIdentifier: AutoPaymentMethodTblCell.cellId)
        return tblView
    }()
    
    private var vm = PaymentAutoRegisterVM()
    
    private let vDividerLine = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#E7E7E7")
        return view
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        setupUI()
        
    }
    
    private func setupTblView() {
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    private func setupUI(){
        view.addSubview(tblView)
        
        NSLayoutConstraint.activate([
            tblView.topAnchor.constraint(equalTo: view.topAnchor),
            tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension PaymentAutoRegisterVC: UITableViewDataSource, UITableViewDelegate {
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
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//    }
    
    
}



