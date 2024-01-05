//
//  AutoPaymentMethodTblCell.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import UIKit

class AutoPaymentMethodTblCell: UITableViewCell {
    static let cellId = "AutoPaymentMethodTblCell"
    
    private let paymentBlockTitle = BlockTitleRow(icon: "ic_money", title: "Phương thức thanh toán")
    private let dividerLine = DividerLine()
    private let btnSelectBtnMethod = SelectPaymentMethodButton()
    
    private let lbSelectMethod: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = UIColor(hex: "#888888")
        lb.text = "Trả tự động chỉ hỗ trợ thẻ quốc tế"
        return lb
    }()
    
    private let cellContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex: "#F5F5F5")
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubViews(cellContentView)
        cellContentView.addSubViews(paymentBlockTitle,dividerLine,lbSelectMethod,btnSelectBtnMethod)
        
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            cellContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cellContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            paymentBlockTitle.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 16),
            paymentBlockTitle.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            paymentBlockTitle.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            
            dividerLine.topAnchor.constraint(equalTo: paymentBlockTitle.bottomAnchor, constant: 16),
            dividerLine.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            dividerLine.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
        
            lbSelectMethod.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 16),
            lbSelectMethod.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            lbSelectMethod.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            
            btnSelectBtnMethod.heightAnchor.constraint(equalToConstant: 48),
            btnSelectBtnMethod.topAnchor.constraint(equalTo: lbSelectMethod.bottomAnchor, constant: 12),
            btnSelectBtnMethod.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 16),
            btnSelectBtnMethod.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -16),
            btnSelectBtnMethod.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -16),
            
        ])
    }
    
}

class SelectPaymentMethodButton: UIView {
    private let imgVMethodIcon: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        imgV.image = UIImage(named: "ic_techcombank")
        return imgV
    }()
    
    private let lbMethodName: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lb.text = "Techcombank"
        return lb
    }()
    
    private let lbMethodNum: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = UIColor(hex: "#888888")
        lb.text = "[*3456]"
        return lb
    }()
    
    private let imgVArrowIcon: UIImageView = {
       let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(named: "ic_arrow_down")
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "##D1D1D1").cgColor
        self.layer.cornerRadius = 8
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubViews(imgVMethodIcon,lbMethodName,lbMethodNum,imgVArrowIcon)
        
        lbMethodName.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            imgVMethodIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
    
            imgVMethodIcon.widthAnchor.constraint(equalToConstant: 32),
            imgVMethodIcon.heightAnchor.constraint(equalTo: imgVMethodIcon.widthAnchor),
            imgVMethodIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            lbMethodName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lbMethodName.heightAnchor.constraint(equalToConstant: 22),
            lbMethodName.leadingAnchor.constraint(equalTo: imgVMethodIcon.trailingAnchor, constant: 10),
            
            lbMethodNum.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lbMethodNum.heightAnchor.constraint(equalToConstant: 22),
            lbMethodNum.leadingAnchor.constraint(equalTo: lbMethodName.trailingAnchor, constant: 1),
            lbMethodNum.trailingAnchor.constraint(equalTo: imgVArrowIcon.leadingAnchor, constant: -1),
            
            imgVArrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imgVArrowIcon.widthAnchor.constraint(equalToConstant: 24),
            imgVArrowIcon.heightAnchor.constraint(equalTo: imgVArrowIcon.widthAnchor),
            imgVArrowIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
        ])
    }
    
}
