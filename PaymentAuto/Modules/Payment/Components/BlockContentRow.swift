//
//  BlockContentRow.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import UIKit

class BlockContentRow: UIView {
    private let lbTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = UIColor(hex: "#888888")
        lb.text = "Người đại diện"
        
        return lb
    }()
    
    
    private let lbContent: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lb.numberOfLines = 0

        return lb
    }()
   
    init(title: String, body: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.text = title
        lbContent.text = body
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubViews(lbTitle,lbContent)
        
        lbContent.setContentHuggingPriority(.defaultHigh, for: .vertical)

        NSLayoutConstraint.activate([
            lbTitle.heightAnchor.constraint(equalToConstant: 22),
                
            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbTitle.bottomAnchor.constraint(equalTo: lbContent.topAnchor, constant: -4),
            
            lbContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbContent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
       
        ])
        

    }

}
