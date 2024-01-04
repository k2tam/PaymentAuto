//
//  BlockTitleRow.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class BlockTitleRow: UIView {
    private let imgVIcon: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    private let lbTitle: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return lb
    }()
    
    init(icon: String, title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        imgVIcon.image = UIImage(named: icon)
        lbTitle.text = title
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.addSubViews(imgVIcon,lbTitle)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 36),
            imgVIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: imgVIcon.trailingAnchor, constant: 16),
            lbTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
