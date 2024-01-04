//
//  ResultView.swift
//  PaymentAuto
//
//  Created by k2 tam on 04/01/2024.
//

import UIKit

class ResultView: UIView {
    private let stackResult : UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 14
        return stack
    }()
    
    private let imgVResultIcon: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(resource: .icRedClose)
        return imgV
    }()
    
    private let lbTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let lbPrice: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lb.textColor = UIColor(hex: "#4360DE")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let lbDesc: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor(hex: "#888888")
        lb.numberOfLines = 0
        lb.textAlignment = .center
        return lb
    }()
    
   
    
    init(amountText: String, content: ContentCheckFreeVoucherModel,typeResult: PaymentResultStatus){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch typeResult {
        case .SUCCESS:
            imgVResultIcon.image = UIImage(resource: .icTick)
        case .SUCCESSAUTOPAY:
            imgVResultIcon.image = UIImage(resource: .icTick)
        case .FAILURE:
            imgVResultIcon.image = UIImage(resource: .icRedClose)
            lbPrice.isHidden = true
        case .SUCCESS_WITHOUT_PAYMENTMETHOD:
            imgVResultIcon.image = UIImage(resource: .icTick)
        }
        
        lbPrice.text = amountText
        lbTitle.text = content.title
        lbDesc.text = content.body
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    

    private func setupUI() {
        let arrangedSubViews = [imgVResultIcon,lbTitle,lbPrice,lbDesc]
      
        for subview in arrangedSubViews {
            stackResult.addArrangedSubview(subview)
        }
        
        self.addSubview(stackResult)
        
        NSLayoutConstraint.activate([
            imgVResultIcon.widthAnchor.constraint(equalToConstant: 48),
            imgVResultIcon.heightAnchor.constraint(equalTo: imgVResultIcon.widthAnchor),
            
            stackResult.topAnchor.constraint(equalTo: self.topAnchor),
            stackResult.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackResult.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackResult.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
       
    }
    
}
