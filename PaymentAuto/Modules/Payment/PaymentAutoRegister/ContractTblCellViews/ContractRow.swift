//
//  BlockContentRow.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class ContractRow: UIView {
    private let lbTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = UIColor(hex: "#888888")
        lb.text = "Số hợp đồng"
        
        return lb
    }()
    
    
    private let lbContent: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lb.numberOfLines = 0

        return lb
    }()
    
    private let dividerLine = DividerLine()
    
    
    
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
        self.addSubViews(lbTitle,lbContent,dividerLine)
        
        
        NSLayoutConstraint.activate([
            lbTitle.heightAnchor.constraint(equalToConstant: 22),

            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbTitle.bottomAnchor.constraint(equalTo: lbContent.topAnchor, constant: -4),
            
            lbContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            dividerLine.topAnchor.constraint(equalTo: lbContent.bottomAnchor, constant: 16),
            dividerLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dividerLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dividerLine.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        

    }
    
}
