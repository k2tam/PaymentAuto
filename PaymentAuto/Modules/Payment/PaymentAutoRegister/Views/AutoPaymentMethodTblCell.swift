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
    
    var isSelectMethod: Bool = false
    
    var didTapSelectMethod: (() -> Void)?
    
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
    
    public func configure(from autoPayDetailModel: AutopayDetailModel?){
        btnSelectBtnMethod.autoPayDetailModel = autoPayDetailModel
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex: "#F5F5F5")
        
        setupUI()
        setupActionForBtnSelectBtnMethod()
    }
    
    
    
    private func setupActionForBtnSelectBtnMethod() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnSelectBtnMethodPressed))
        btnSelectBtnMethod.addGestureRecognizer(tapGesture)
    }
    
    // Function to be triggered when the button is tapped
        @objc private func btnSelectBtnMethodPressed() {
            // Your code to be executed when the button is tapped
            didTapSelectMethod?()
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
    
    let sampleModel = AutopayDetailModel()
    
    var autoPayDetailModel: AutopayDetailModel? = nil {
        didSet {
            self.configure(from: autoPayDetailModel)
        }
    }
    
    private let stackMethodBtnContent: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private let imgVMethodIcon: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        imgV.image = UIImage(named: "ic_techcombank")
        return imgV
    }()
    
    private let lbMethod: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.text = "Chọn phương thức"
        return lb
    }()
    
    private let imgVArrowIcon: UIImageView = {
       let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.image = UIImage(named: "ic_arrow_down")
        return imgV
    }()
    
    public func configureLabelMethod(from: AutopayDetailModel) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "##D1D1D1")?.cgColor
        self.layer.cornerRadius = 8
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(from autoPayDetailModel: AutopayDetailModel?){
        if let autoPayDetailModel = self.autoPayDetailModel {
            //Case already have payment method
            imgVMethodIcon.isHidden = false
            imgVMethodIcon.image = UIImage(named: "ic_techcombank")
            
            if let cardBrand  = autoPayDetailModel.cardBrand, let cardNumber = autoPayDetailModel.cardNumber {

                let fullMethodLBText = "\(cardBrand) \(cardNumber)"
                let attributedString = NSMutableAttributedString(string: fullMethodLBText)

                
                let rangeCardBrand = (fullMethodLBText as NSString).range(of: cardBrand)
                let rangeCardNumber = (fullMethodLBText as NSString).range(of: cardNumber)

                
                //Font for card brand
                let boldFont = UIFont.systemFont(ofSize: 16, weight: .medium)
                attributedString.addAttributes([NSAttributedString.Key.font: boldFont,], range: rangeCardBrand)
                
                //Font for card number
                let secondaryTextColor = UIColor(hex: "#888888")
                attributedString.addAttributes([NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: secondaryTextColor], range: rangeCardNumber)
                
                
                lbMethod.attributedText = attributedString

                
            }
          
            
        }else{
            //Case not have payment method
            imgVMethodIcon.isHidden = true
            lbMethod.text = "Chọn phương thức"
        }
    }
    
    private func setupUI() {
        configure(from: self.autoPayDetailModel)
        
        self.addSubViews(stackMethodBtnContent,imgVArrowIcon)
        
        let arrangedSubViews = [imgVMethodIcon, lbMethod]
        
        for subView in arrangedSubViews {
            stackMethodBtnContent.addArrangedSubview(subView)
        }
        
        NSLayoutConstraint.activate([
            imgVMethodIcon.widthAnchor.constraint(equalToConstant: 32),
            imgVMethodIcon.heightAnchor.constraint(equalTo: imgVMethodIcon.widthAnchor),
            
            lbMethod.heightAnchor.constraint(equalToConstant: 22),
            
            stackMethodBtnContent.widthAnchor.constraint(equalToConstant: 150),
            stackMethodBtnContent.heightAnchor.constraint(equalToConstant: 32),
            stackMethodBtnContent.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackMethodBtnContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            stackMethodBtnContent.trailingAnchor.constraint(equalTo: imgVArrowIcon.leadingAnchor, constant: -1),
            
            
            imgVArrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imgVArrowIcon.widthAnchor.constraint(equalToConstant: 24),
            imgVArrowIcon.heightAnchor.constraint(equalToConstant: 24),
            imgVArrowIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
        ])
    }
    
}
