//
//  ContractTblCell.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import UIKit

class ContractTblCell: UITableViewCell {
    static let cellId = "ContractTblCell"
    
    
    private let cellContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    private let stackContractBlock: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private let contractTitleRow = BlockTitleRow(icon: "ic_contract", title: "Thông tin hợp đồng")
    private let contractTitleDivider = DividerLine()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex: "#F5F5F5")
        addSubViews(contractTitleRow)
    }
    
    public func configure(from contract: Contract){
        setupUI(contract: contract)
        
        let contractContentRows: [BlockContentRow] = [
            BlockContentRow(title: "Số hợp đồng", body: contract.contactNo),
            BlockContentRow(title: "Người đại diện", body: contract.presenterName),
            BlockContentRow(title: "Địa chỉ lắp đặt", body: contract.address),
        ]
        
        for (index,item) in contractContentRows.enumerated() {
            stackContractBlock.addArrangedSubview(item)
            
            if index != contractContentRows.count - 1{
                let dividerLine = DividerLine()
                dividerLine.translatesAutoresizingMaskIntoConstraints = false
                stackContractBlock.addArrangedSubview(dividerLine)
            }
          
        }
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(contract: Contract){
        addSubViews(cellContentView)
        cellContentView.addSubViews(contractTitleRow,contractTitleDivider,stackContractBlock)

        
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            cellContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cellContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            contractTitleRow.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 16),
            contractTitleRow.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            contractTitleRow.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            

            contractTitleDivider.topAnchor.constraint(equalTo: contractTitleRow.bottomAnchor, constant: 16),
            contractTitleDivider.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            contractTitleDivider.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            
            stackContractBlock.topAnchor.constraint(equalTo: contractTitleDivider.bottomAnchor, constant: 16),
            stackContractBlock.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            stackContractBlock.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            stackContractBlock.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -16),
            


        ])
        
       
    }
}
