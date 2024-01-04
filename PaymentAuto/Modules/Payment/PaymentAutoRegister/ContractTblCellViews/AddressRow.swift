//
//  AddressRow.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import UIKit

class AddressRow: UIView {
    private let lbTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = UIColor(hex: "#888888")
        lb.text = "Địa chỉ lắp đặt"
        
        return lb
    }()
    
    
    private let lbContent: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lb.numberOfLines = 0
        return lb
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configureContent(content: String) {
        lbContent.text = content
    }
   
    
    private func setupUI() {
        self.addSubViews(lbTitle,lbContent)
        
        lbContent.setContentHuggingPriority(.defaultHigh, for: .vertical)

        NSLayoutConstraint.activate([
                
            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbTitle.heightAnchor.constraint(equalToConstant: 22),
            lbTitle.bottomAnchor.constraint(equalTo: lbContent.topAnchor),
            
            lbContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        

    }
    
}
