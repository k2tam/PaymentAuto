//
//  ResultSecondaryView.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class ResultAddOnView: UIView {
    private let imgVImage: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    private let lbTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        lb.textAlignment = .center
        lb.numberOfLines = 0

        return lb
    }()
    
    private let lbDesc: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = UIColor(hex: "#888888")
        lb.textAlignment = .center
        lb.numberOfLines = 0

        return lb
    }()
    
    
    let btnAddOn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Liên kết ngay", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor(hex: "#4564ED"), for: .normal)
        btn.backgroundColor = UIColor(hex: "#F0F3FE")
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    var addOnAction: (() -> Void)
   
    
    
    // Custom initializer with callback
    init(addOnAction: @escaping (() -> Void)) {
            self.addOnAction = addOnAction
            super.init(frame: .zero)
            self.backgroundColor = .white
            self.layer.cornerRadius = 8
            self.translatesAutoresizingMaskIntoConstraints = false
        
            btnAddOn.addTarget(self, action: #selector(btnConnectCreditPressed), for: .touchUpInside)

            setupUI()
        }
    
    public func configure(from addOnModel: AddOnResultModel){
        imgVImage.image = UIImage(named: addOnModel.img)
        lbTitle.text = addOnModel.title
        lbDesc.text = addOnModel.desc
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.addSubViews(imgVImage,lbTitle,lbDesc,btnAddOn)
        
        NSLayoutConstraint.activate([
            imgVImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            imgVImage.widthAnchor.constraint(equalToConstant: 140),
            imgVImage.heightAnchor.constraint(equalToConstant: 80),
            imgVImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            lbTitle.topAnchor.constraint(equalTo: imgVImage.bottomAnchor, constant: 24),
            lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            lbDesc.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 16),
            lbDesc.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            lbDesc.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            btnAddOn.heightAnchor.constraint(equalToConstant: 48),
            btnAddOn.topAnchor.constraint(equalTo: lbDesc.bottomAnchor, constant: 24),
            btnAddOn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            btnAddOn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            btnAddOn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
        ])
    }
    
    @objc private func btnConnectCreditPressed() {
        addOnAction()
    }
    
}
