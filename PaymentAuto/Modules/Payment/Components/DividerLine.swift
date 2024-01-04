//
//  DividerLine.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class DividerLine: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(hex: "#DDDDDD")
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
