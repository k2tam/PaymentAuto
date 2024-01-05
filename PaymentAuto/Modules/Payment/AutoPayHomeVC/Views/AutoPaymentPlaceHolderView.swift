//
//  AutoPaymentPlaceHolderView.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

protocol AutoPayPlaceHolderViewDelegate: AnyObject {
    func didPressRegister()
}

class AutoPayPlaceHolderView: UIView {
    
    weak var delegate: AutoPayPlaceHolderViewDelegate?

    let imgVPlaceHolder: UIImageView = {
       let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(resource: .imgAutoPayment)
        return imgV
    }()
    
    let lbTitle: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Trả tự động, nhận ưu đãi"
        lb.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return lb
    }()
    
    let lbDesc: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Thanh toán rảnh tay hàng tháng,\n không lo trễ cước!"
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lb.textColor = UIColor(hex: "#888888")
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    
    let btnRegister: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Đăng ký ngay", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        btn.backgroundColor = UIColor(hex: "#4564ED")
        btn.layer.cornerRadius = 8
        return btn
    }()
    
       @objc private func registerPressed() {
           
           delegate?.didPressRegister()

       }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
        btnRegister.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubViews(imgVPlaceHolder,lbTitle,lbDesc,btnRegister)
        
        
        NSLayoutConstraint.activate([
            imgVPlaceHolder.widthAnchor.constraint(equalToConstant: 140),
            imgVPlaceHolder.heightAnchor.constraint(equalToConstant: 134.7),
            imgVPlaceHolder.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imgVPlaceHolder.topAnchor.constraint(equalTo: self.topAnchor, constant: 139.5),
            
            lbTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbTitle.topAnchor.constraint(equalTo: imgVPlaceHolder.bottomAnchor, constant: 40),
            
            lbDesc.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbDesc.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 24),
            
            
            btnRegister.heightAnchor.constraint(equalToConstant: 46),
            btnRegister.widthAnchor.constraint(equalToConstant: 265),
            btnRegister.topAnchor.constraint(equalTo: lbDesc.bottomAnchor, constant: 24),
            btnRegister.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ])
    }
    
    
    
}
