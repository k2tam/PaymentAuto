//
//  HiHeaderView.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//


import Foundation
import UIKit
open class HiBottomView: UIView {
    public lazy var topLine : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#EBEBEB", alpha: 1)
        return v
    }()
    open lazy var btnPrimary = ButtonPrimary()
    open lazy var viewBG = UIView()
    open var callbackActionButton : (()->Void)?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    func setupUI(){
        btnPrimary.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.backgroundColor = .white
//        viewBG.layer.shadowColor = UIColor.black.cgColor
//        viewBG.layer.shadowOffset = CGSize(width: 1, height: -3)
//        viewBG.layer.shadowOpacity = 0.1
//        viewBG.layer.cornerRadius = 12
//        viewBG.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewBG.backgroundColor = UIColor.white
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        btnPrimary.isEnabled = true
        btnPrimary.translatesAutoresizingMaskIntoConstraints = false
        topLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(viewBG)
        self.addSubview(btnPrimary)
        self.addSubview(topLine)
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: self.topAnchor),
            viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            btnPrimary.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor),
            btnPrimary.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            btnPrimary.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 382.0/414.0),
            btnPrimary.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 48/84),
            
            topLine.topAnchor.constraint(equalTo: self.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 1),
        ])
        btnPrimary.addTarget(self, action: #selector(setFunction), for: .touchUpInside)
        
        setNewPrimaryColor()
    }
    public func setNewPrimaryColor(){
        btnPrimary.setNewPrimaryColor()
    }
    @objc func setFunction(){
        callbackActionButton?()
    }
}

@IBDesignable public class HiNewHeaderView: UIView {
    public lazy var btnBack = ButtonLeftBar()
    public lazy var btnRightBarOPtion = ButtonRightBarOption()
    public lazy var lblTitle = LabelTitle()
    public lazy var btnHistory = ButtonHistory()
    private lazy var stackView : UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 0
        v.alignment = .fill
//        v.distribution = .fillEqually
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
   
    public lazy var bottomLine : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#EBEBEB", alpha: 1)
        return v
    }()
//    var btnBackCallback : (()->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        guard let titleButton = btnRightBarOPtion.titleLabel?.text , titleButton != "" else {return}
        btnRightBarOPtion.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        btnRightBarOPtion.imageEdgeInsets = UIEdgeInsets(top: 0, left: -14, bottom: 0, right: 14)
    }
    func setupUI(){
        //set default data for btnRightBarOption
        btnRightBarOPtion.data = [
            DropViewModel(imv: "back-to-home-black", title: Localizable.shared.localizedString(key: "back_to_home"), clickHandler: {[weak self] in
                guard let self = self else {return}
                if let navigationController = self.window?.rootViewController as? UINavigationController {
                    navigationController.popToRootViewController(animated: true)
                }
            })
        ]
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        btnBack.tintColor = UIColor(hex: "#333333", alpha: 1)
        btnRightBarOPtion.translatesAutoresizingMaskIntoConstraints = false
        if var image = UIImage(named: "ic_three_dot_gray"){
            image = image.withRenderingMode(.alwaysTemplate)
            btnRightBarOPtion.setImage(image, for: .normal)
        }
        btnRightBarOPtion.tintColor = UIColor(hex: "#333333", alpha: 1)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.minimumScaleFactor = 0.8
        lblTitle.adjustsFontSizeToFitWidth = true
        lblTitle.text = ""
        lblTitle.textColor = UIColor(hex: "#333333", alpha: 1)
        btnHistory.translatesAutoresizingMaskIntoConstraints = false
        if var imageHistory = UIImage(named: "ic_history_white"){
            imageHistory = imageHistory.withRenderingMode(.alwaysTemplate)
            btnHistory.setImage(imageHistory, for: .normal)
        }
        btnHistory.tintColor = UIColor(hex: "#333333", alpha: 1)
        
        self.addSubview(btnBack)
        self.addSubview(stackView)
        stackView.addArrangedSubview(btnHistory)
        stackView.addArrangedSubview(btnRightBarOPtion)
        btnHistory.isHidden = true
        self.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            btnBack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1),
            btnBack.widthAnchor.constraint(equalTo: btnBack.heightAnchor, multiplier: 1),
            btnBack.topAnchor.constraint(equalTo: self.topAnchor),
            btnBack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            btnBack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            btnRightBarOPtion.widthAnchor.constraint(greaterThanOrEqualTo: btnBack.widthAnchor),
            btnHistory.widthAnchor.constraint(equalToConstant: 32),
            
            stackView.heightAnchor.constraint(equalTo: btnBack.heightAnchor),
            stackView.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: lblTitle.trailingAnchor, constant: 4),
            
            lblTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor),
            
            
        ])
        self.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    public func setupTitle(title: String) {
        lblTitle.text = title
    }
    
    /// Default right button will show drop down
    public func setupRightButton(dropDownList: [DropViewModel]) {
        btnRightBarOPtion.data = dropDownList
    }
    
    /// Setup custom image and custom click action of button right
    /// - Parameters:
    ///   - image: image of button
    ///   - tintColor: if tint color == nil -> tint = #333333
    ///   - onClick: click action
    public func setupRightButton(image: UIImage?, tint tintColor: UIColor? = nil, onClick: @escaping () -> Void) {
        let image = image?.withRenderingMode(.alwaysTemplate)
        btnRightBarOPtion.setImage(image, for: .normal)
        if let color = tintColor {
            btnRightBarOPtion.tintColor = color
        } else {
            btnRightBarOPtion.tintColor = UIColor(hex: "#333333", alpha: 1)
        }
        btnRightBarOPtion.callback = onClick
    }
}

public class ButtonRightBarOption: UIButton {
    public var data : [DropViewModel]? = [
        DropViewModel(
            imv: "back-to-home-black",
            title: Localizable.shared.localizedString(key: "back_to_home"),
            clickHandler: {}
        )
    ]
    public var callback : (()-> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()

    }
    func setupUI(){
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: "ic_three_dot_gray"), for: .normal)
        self.addTarget(self, action: #selector(setFunctionRightBarOption), for: .touchUpInside)
    }
    @objc func setFunctionRightBarOption(){
        if callback != nil{
            callback?()
        }else{
            guard let data = data else { return }
//            DropDownManager.shared.showDropView(sender: self, data: data, onSelect: {_ in})
        }
    }
    
    
}
public struct DropViewModel {
    var imv:String? = nil
    var title:String?
    var titleColor: UIColor = .black
    var typeImage: TypeImage = .ic
    var clickHandler: () -> Void
    
    public init(
        imv: String? = nil,
        title: String?,
        titleColor: UIColor = .black,
        typeImage: TypeImage = .ic,
        clickHandler: @escaping () -> Void
    ) {
        self.titleColor = titleColor
        self.imv = imv
        self.title = title
        self.typeImage = typeImage
        self.clickHandler = clickHandler
    }
}
public enum TypeImage{
    case url, ic
}
public class ButtonLeftBar: UIButton {
    public var callback : (()-> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()

    }
    func setupUI(){
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: "ic_back"), for: .normal)
        self.addTarget(self, action: #selector(setFunctionLeftBar), for: .touchUpInside)
    }
   @objc func setFunctionLeftBar(){
       if callback == nil {
           if let navigationController = self.window?.rootViewController as? UINavigationController {
                   navigationController.popViewController(animated: true)
           }
       }else{
           callback?()
       }
    }
}

public class LabelTitle : UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func setup(){
        self.textAlignment = .center
        self.textColor =  UIColor(hex: "#333333", alpha: 1)
        self.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        self.numberOfLines = 2
    }
}

