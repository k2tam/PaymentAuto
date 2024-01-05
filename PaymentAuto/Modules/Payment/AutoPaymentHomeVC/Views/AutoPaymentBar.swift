//
//  AutoPaymentBar.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class AutoPaymentBar: UIView {
    private let lbPaymentBarTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Thanh toán tự động cho:"
        lb.textColor = UIColor(hex: "#888888")
        lb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return lb
    }()
    
    
    private let vButtonContract: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDE4FC").cgColor
        view.layer.cornerRadius = 22 / 2
        return view
    }()
    
    private let lbContractNo: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "HDN123001"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private let imgArrowDown: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(resource: .icDownArrow)
        return imgV
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubViews(lbPaymentBarTitle, vButtonContract)
        vButtonContract.addSubViews(lbContractNo, imgArrowDown)
        
        
        NSLayoutConstraint.activate([
            lbPaymentBarTitle.heightAnchor.constraint(equalToConstant: 22),
            lbPaymentBarTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            lbPaymentBarTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            lbPaymentBarTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            vButtonContract.widthAnchor.constraint(equalToConstant: 133),
            vButtonContract.heightAnchor.constraint(equalToConstant: 28),
            vButtonContract.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vButtonContract.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            lbContractNo.heightAnchor.constraint(equalToConstant: 20),
            lbContractNo.centerYAnchor.constraint(equalTo: vButtonContract.centerYAnchor),
            lbContractNo.leadingAnchor.constraint(equalTo: vButtonContract.leadingAnchor, constant: 16),

            
            imgArrowDown.widthAnchor.constraint(equalToConstant: 20),
            imgArrowDown.heightAnchor.constraint(equalTo: imgArrowDown.widthAnchor),
            imgArrowDown.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imgArrowDown.trailingAnchor.constraint(equalTo: vButtonContract.trailingAnchor, constant: -8),
            
        ])
    }
}
