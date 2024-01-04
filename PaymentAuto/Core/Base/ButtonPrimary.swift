//
//  ButtonPrimary.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/4/24.
//

import UIKit

@IBDesignable

class ButtonSecondary: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isEnabled = true
    }

    override var isEnabled: Bool{
        didSet{
            if (isEnabled) {
                setTitleColor(UIColor(hex: "#2F3954"), for: .normal)
                backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                roundCorner(borderColor: UIColor(hex:"#2F3954")!, borderWidth: 1, cornerRadius: 8)
            } else {
                setTitleColor(UIColor(hex:"#FFFFFF"), for: .normal)
                backgroundColor = UIColor(hex: "C7CBCF")
                roundCorner(borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), borderWidth: 0, cornerRadius: 8)
            }
        }
    }
}

class ButtonWithBorder: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isEnabled: Bool{
        didSet{
            if (isEnabled) {
                setTitleColor(UIColor(hex: "#2F3954"), for: .normal)
                backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                roundCorner(borderColor: UIColor(hex:"#2F3954")!, borderWidth: 1, cornerRadius: 8)
            } else {
                setTitleColor(UIColor(hex:"#FFFFFF"), for: .normal)
                backgroundColor = UIColor(hex: "C7CBCF")
                roundCorner(borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), borderWidth: 0, cornerRadius: 8)
            }
        }
    }
}


class HiHeaderView: UIView {

    lazy var btnBack = ButtonLeftBar()
    lazy var btnRightBarOPtion = ButtonRightBarOption()
    lazy var lblTitle = LableTitle()
    lazy var btnHistory = ButtonHistory()
//    var btnBackCallback : (()->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    func setupUI(){

        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.setImage(UIImage(named: "ic_back_white"), for: .normal)
        btnRightBarOPtion.translatesAutoresizingMaskIntoConstraints = false
        btnRightBarOPtion.setImage(UIImage(named: "ic_dots_white"), for: .normal)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.minimumScaleFactor = 0.8
        lblTitle.adjustsFontSizeToFitWidth = true
        lblTitle.text = ""
        btnHistory.translatesAutoresizingMaskIntoConstraints = false
        btnHistory.setImage(UIImage(named: "ic_history_white"), for: .normal)
        self.addSubview(btnBack)
        self.addSubview(btnRightBarOPtion)
        self.addSubview(btnHistory)
        btnHistory.isHidden = true
        self.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            btnBack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            btnBack.widthAnchor.constraint(equalTo: btnBack.heightAnchor, multiplier: 1),
            btnBack.topAnchor.constraint(equalTo: self.topAnchor),
            btnBack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            btnBack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            btnRightBarOPtion.widthAnchor.constraint(equalTo: btnBack.widthAnchor),
            btnRightBarOPtion.heightAnchor.constraint(equalTo: btnBack.heightAnchor),
            btnRightBarOPtion.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor),
            btnRightBarOPtion.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            btnHistory.widthAnchor.constraint(equalTo: btnBack.widthAnchor, multiplier: 0.8),
            btnHistory.heightAnchor.constraint(equalTo: btnBack.heightAnchor),
            btnHistory.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor),
            btnHistory.trailingAnchor.constraint(equalTo: btnRightBarOPtion.leadingAnchor, constant: 4),
            
            lblTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lblTitle.trailingAnchor.constraint(equalTo: btnHistory.leadingAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor),
            
            
        ])
    }
}
//class ButtonRightBarOption: UIButton {
////    var data : [DropViewModel]? = [DropViewModel(imv: "back-to-home-black", title: Localizable.shared.localizedString(key: "back_to_home"))]
//    var callback : (()-> Void)?
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupUI()
//        
//    }
//    func setupUI(){
//        self.setTitle("", for: .normal)
//        self.setImage(UIImage(named: "ic_dots_white"), for: .normal)
//        self.addTarget(self, action: #selector(setFunctionRightBarOption), for: .touchUpInside)
//    }
//    @objc func setFunctionRightBarOption(){
//        if callback != nil{
//            callback?()
//        }else{
////            guard let data = data else {
////                return
////            }
////            DropDownManager.shared.showDropView(sender: self, data: data, onSelect: { [weak self] number in
////                switch number {
////                default :
////                    if let navigationController = self!.window?.rootViewController as? UINavigationController {
////                        navigationController.popToRootViewController(animated: true)
////                    }
////                }
////            })
//        }
//    }
//}
//class ButtonLeftBar: UIButton {
//    var callback : (()-> Void)?
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupUI()
//        
//    }
//    func setupUI(){
//        self.setTitle("", for: .normal)
//        self.setImage(UIImage(named: "ic_back_white"), for: .normal)
//        self.addTarget(self, action: #selector(setFunctionLeftBar), for: .touchUpInside)
//    }
//   @objc func setFunctionLeftBar(){
//       if callback == nil {
//           getClosestViewController()?.navigationController?.popViewController(animated: true)
////           if let navigationController = self.window?.rootViewController as? UINavigationController {
////                   navigationController.popViewController(animated: true)
////           }
//       }else{
//           callback?()
//       }
//    }
//    
//    func getClosestViewController() -> UIViewController? {
//        var responder: UIResponder? = self
//
//        while responder != nil {
//
//            if let responder = responder as? UIViewController {
//                return responder
//            }
//            responder = responder?.next
//        }
//        return nil
//    }
//    
//   
//}
class ButtonHistory: UIButton {
    var callback : (()-> Void)?
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
        self.setImage(UIImage(named: "ic_back_white"), for: .normal)
        self.addTarget(self, action: #selector(setFunction), for: .touchUpInside)
    }
   @objc func setFunction(){
           callback?()
    }
    
   
}
class LableTitle : UILabel{
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
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.numberOfLines = 2
    }
}
class LableRequired : UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func setupLableRequired(){
        let attr = NSAttributedString(string: "*", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        let mulAttr = NSMutableAttributedString(string: self.text ?? "")
        mulAttr.append(attr)
        self.attributedText = mulAttr
    }
}
open class ButtonPrimary: UIButton {

    open var enableColor : UIColor = ThemesManager.share().getThemes().getPrimaryColor()// #colorLiteral(red: 0.2352941176, green: 0.3058823529, blue: 0.4274509804, alpha: 1)

    open var disableColor : UIColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.45)
    open var enableTextColor : UIColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    open var disableTextColor : UIColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    func setupUI(){
        isEnabled = true
        tintColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    public override var isEnabled: Bool{
        didSet{
            layer.cornerRadius = 8
            if (isEnabled) {
                setTitleColor(enableTextColor, for: .normal)
                backgroundColor = enableColor
                
            } else {
                setTitleColor(disableTextColor, for: .normal)
                backgroundColor =  disableColor
            }
        }
    }
    public func setNewPrimaryColor(){
        enableColor = ThemesManager.share().getThemes().getPrimaryColor()
        enableTextColor = ThemesManager.share().getThemes().getTextColorOnPrimary()
        isEnabled = true
    }
}


