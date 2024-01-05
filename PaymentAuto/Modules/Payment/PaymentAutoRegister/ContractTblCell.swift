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
    
    private let contractTitleRow = BlockTitleRow(icon: "ic_contract", title: "Thông tin hợp đồng")
    private let contractTitleDivider = DividerLine()
    
    private let contractRow = ContractRow()
    private let presenterRow = PresenterRow()
    private let addressRow = AddressRow()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex: "#F5F5F5")
        addSubViews(contractTitleRow)
    }
    
    public func configure(from contract: Contract){
        setupUI()
        contractRow.configureContent(content: contract.contactNo)
        presenterRow.configureContent(content: contract.presenterName)
        addressRow.configureContent(content: contract.address)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubViews(cellContentView)
        cellContentView.addSubViews(contractTitleRow,contractTitleDivider,contractRow,presenterRow,addressRow)
        
        
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
            
            contractRow.topAnchor.constraint(equalTo: contractTitleDivider.bottomAnchor, constant: 16),
            contractRow.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            contractRow.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            
            presenterRow.topAnchor.constraint(equalTo: contractRow.bottomAnchor, constant: 16),
            presenterRow.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            presenterRow.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            
            addressRow.topAnchor.constraint(equalTo: presenterRow.bottomAnchor, constant: 16),
            addressRow.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            addressRow.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            addressRow.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -16),

        ])
    }
}
