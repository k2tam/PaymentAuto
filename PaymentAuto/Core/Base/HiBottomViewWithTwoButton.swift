//
//  HiBottomViewWithTwoButton.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/4/24.
//
import UIKit
class HiBottomViewWithTwoButton: UIView {
    
    lazy var btnPrimary = ButtonPrimary()
    lazy var btnSecondary = ButtonWithBorder()
    lazy var svMain: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 7
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    lazy var viewBG = UIView()
    var callbackPrimaryBtn : (()->Void)?
    var callbackSecondaryButton : (()->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    func setupUI(){
        self.backgroundColor = .white
        viewBG.layer.shadowColor = UIColor.black.cgColor
        viewBG.layer.shadowOffset = CGSize(width: 1, height: -3)
        viewBG.layer.shadowOpacity = 0.1
        viewBG.layer.cornerRadius = 12
        viewBG.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewBG.backgroundColor = UIColor.white
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        btnPrimary.translatesAutoresizingMaskIntoConstraints = false
        btnSecondary.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(viewBG)
        self.addSubview(svMain)
        self.svMain.addArrangedSubview(btnSecondary)
        self.svMain.addArrangedSubview(btnPrimary)

        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: self.topAnchor),
            viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
//            btnPrimary.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor),
            svMain.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            svMain.leadingAnchor.constraint(equalTo: viewBG.leadingAnchor,constant: 16),
            svMain.trailingAnchor.constraint(equalTo: viewBG.trailingAnchor,constant: -16),
            svMain.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 48/84)
        ])
        btnPrimary.addTarget(self, action: #selector(setFunctionForPrimaryBtn), for: .touchUpInside)
        btnSecondary.addTarget(self, action: #selector(setFunctionForSecondBtn), for: .touchUpInside)
    }
    @objc func setFunctionForPrimaryBtn(){
        callbackPrimaryBtn?()
    }
    func setNewPrimaryColor(){
        btnPrimary.enableColor = UIColor(red: 0.235, green: 0.306, blue: 0.427, alpha: 1)
        btnPrimary.enableTextColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        btnPrimary.disableColor = UIColor(red: 0.782, green: 0.798, blue: 0.812, alpha: 1)
        btnPrimary.disableTextColor = UIColor(red: 0.588, green: 0.588, blue: 0.588, alpha: 1)
    }
    
    func hideSecondaryButton(){
        btnSecondary.isHidden = true
    }
    
    func showSecondaryButton(){
        btnSecondary.isHidden = false
    }
    
    func hidePrimaryButton(){
        btnPrimary.isHidden = true
    }
    
    func showPrimaryButton(){
        btnPrimary.isHidden = false
    }
    
    @objc func setFunctionForSecondBtn(){
        callbackSecondaryButton?()
    }
}

