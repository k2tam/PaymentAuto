//
//  PopupVC.swift
//  HiThemes
//
//  Created by Trinh Quang Hiep on 10/11/2022.
//

import UIKit
public enum HiThemesPopupType{
    case confirm(title: String,
                 content: NSMutableAttributedString,
                 titleLeftBtn: String,
                 titleRightBtn: String,
                 actionLeftBtn : (()->Void)?,
                 actionRightBtn : (()->Void)?) // content , 2 button
    case alert(title: String,
               content: NSMutableAttributedString,
               titleRightBtn: String,
               actionRightBtn : (()->Void)?)  // content , 1 button
    case alertWithImage(title: String,
                        image: UIImage,
                        content: NSMutableAttributedString,
                        titleRightBtn: String,
                        actionRightBtn : (()->Void)?)  // image, content, 1 button
}
class PopupVC: BaseViewController {
    @IBOutlet weak var popupContainer: UIView!
    @IBOutlet weak var lblTitle: LabelTitlePopup!
    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var stackContent: UIStackView!
    
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblContent: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: ButtonPrimary!
    var rightBtnColor : UIColor = #colorLiteral(red: 0.2352941176, green: 0.3058823529, blue: 0.4274509804, alpha: 1)
        
    
    private var popupType : HiThemesPopupType?
    private var isShowBtnClose: Bool = true
    private var titlePopup : String = ""
    private var contentPopup : NSMutableAttributedString?
    private var imagePopup : UIImage?
    private var leftBtnTitle : String?
    private var rightBtnTitle : String?
    
    var callbackActionLeftButton : (()->Void)?
    var callbackActionRightButton : (()->Void)?
    var callbackActionCloseButton : (()->Void)?
    var isCountdown : Bool = true
    var countdownTime = 5
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard isCountdown == true else {return}
        self.rightButton.isEnabled = false
        self.rightButton.backgroundColor = rightBtnColor.withAlphaComponent(0.5)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
            guard let _self = self else {return}
            if _self.countdownTime > 0 {
                _self.countdownTime -= 1
                _self.rightButton.setTitle("\(_self.rightBtnTitle ?? "") (\(_self.countdownTime))", for: .normal)
                _self.rightButton.isEnabled = false
                _self.rightButton.backgroundColor = _self.rightBtnColor.withAlphaComponent(0.5)
                } else {
                    timer.invalidate()
                    _self.rightButton.setTitle("\(_self.rightBtnTitle ?? "")", for: .normal)
                    _self.rightButton.isEnabled = true
                }
            }
    }
  
    func initUI(){
        rightButton.enableColor = rightBtnColor
        
        self.rightButton.setNewPrimaryColor()
        popupContainer.layer.cornerRadius = 16
        btnClose.setImage(UIImage(named: "ic-shape-close-popup48"), for: .normal)
        lblContent.textColor = UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1)
        lblContent.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        leftButton.setTitleColor(UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1), for: .normal)
        rightButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        addAction()
    }
    func addAction(){
        btnClose.addTarget(self, action: #selector(closeBtnAction), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftBtnAction), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
    }
    @objc func leftBtnAction(){
        UIView.animate(withDuration: 0.2, delay: 0,
                       options: [.curveEaseInOut, .transitionCrossDissolve], animations: {[weak self] in
            self?.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            self?.view.alpha = 0
        }) { [weak self] _ in
            self?.dismiss(animated: false, completion: {[weak self] in
                self?.callbackActionLeftButton?()
            })
           
        }
        
    }
    
    @objc func rightBtnAction(){
        UIView.animate(withDuration: 0.2, delay: 0,
                       options: [.curveEaseInOut, .transitionCrossDissolve], animations: {[weak self] in
            self?.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            self?.view.alpha = 0
        }) { [weak self] _ in
            self?.dismiss(animated: false, completion: {[weak self] in
                self?.callbackActionRightButton?()
            })
           
        }
      
    }
    @objc func closeBtnAction(){
        UIView.animate(withDuration: 0.2, delay: 0,
                       options: [.curveEaseInOut, .transitionCrossDissolve], animations: {[weak self] in
            self?.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            self?.view.alpha = 0
        }) { [weak self] _ in
            self?.dismiss(animated: false, completion: {[weak self] in
                self?.callbackActionCloseButton?()
            })
          
        }
    }
    
    
    func setupUI(popupType : HiThemesPopupType, isShowBtnClose: Bool, actionClose: (()->Void)?){
        self.popupType = popupType
        self.isShowBtnClose = isShowBtnClose
        callbackActionCloseButton = actionClose
        switch popupType {
        case .confirm(let title,let content, let titleLeftBtn, let titleRightBtn, let actionLeft, let actionRight):
            self.titlePopup = title
            self.contentPopup = content
            self.leftBtnTitle = titleLeftBtn
            self.rightBtnTitle = titleRightBtn
            callbackActionLeftButton = actionLeft
            callbackActionRightButton = actionRight
        case .alert(let title,let content, let titleRightBtn, let actionRight):
            self.titlePopup = title
            self.contentPopup = content
            self.rightBtnTitle = titleRightBtn
            callbackActionRightButton = actionRight
        case .alertWithImage(let title,let image, let content, let titleRightBtn, let actionRight):
            self.titlePopup = title
            self.contentPopup = content
            self.rightBtnTitle = titleRightBtn
            self.imagePopup = image
            callbackActionRightButton = actionRight
        }
    }
    
    func setupUIWithRawData(title: String,
                 content: NSMutableAttributedString,
                 image : UIImage?,
                 titleLeftBtn: String? = "",
                 titleRightBtn: String,
                 actionLeftBtn: (()->Void)?,
                 actionRightBtn: @escaping (()->Void),
                 actionClose : (()->Void)? = nil){
        
        self.callbackActionCloseButton = actionClose
        
        self.titlePopup = title
        self.contentPopup = content
        self.rightBtnTitle = titleRightBtn
        self.callbackActionRightButton = actionRightBtn
        self.leftBtnTitle = titleLeftBtn
        self.callbackActionLeftButton = actionLeftBtn
        self.imagePopup = image
        
        
      
        
    }
    func fillUIFollowData(){
        btnClose.isHidden = !isShowBtnClose
        lblTitle.text = self.titlePopup
        lblContent.attributedText = self.contentPopup
        if isCountdown == true {
            rightButton.setTitle("\(self.rightBtnTitle ?? "") (\(self.countdownTime))", for: .normal)
        }else {
            rightButton.setTitle(self.rightBtnTitle, for: .normal)
        }
        
        
        switch self.leftBtnTitle{
        case "":
            self.leftButton.setTitle(self.leftBtnTitle ?? "", for: .normal)
            self.leftButton.isEnabled = false
            self.leftButton.isHidden = false
        case nil:
            self.leftButton.isHidden = true
        default:
            self.leftButton.setTitle(self.leftBtnTitle ?? "", for: .normal)
            self.leftButton.isEnabled = true
            self.leftButton.isHidden = false
        }
        if self.imagePopup == nil{
            self.imgView.isHidden = true
        }else{
            self.imgView.isHidden = false
            self.imgIcon.image = self.imagePopup
        }
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if popupType != nil{
        self.fillUIFollowType()
        }else{
        self.fillUIFollowData()
        }
    }
    func fillUIFollowType(){
        guard let popupType = popupType else {
            return
        }
        btnClose.isHidden = !isShowBtnClose
        if isCountdown == true {
            rightButton.setTitle("\(self.rightBtnTitle ?? "") (\(self.countdownTime))", for: .normal)
        }else {
            rightButton.setTitle(self.rightBtnTitle, for: .normal)
        }
        switch popupType {
        case .confirm:
            lblTitle.text = self.titlePopup
            imgView.isHidden = true
            lblContent.attributedText = self.contentPopup
            leftButton.setTitle(self.leftBtnTitle, for: .normal)
            
         
        case .alert:
            lblTitle.text = self.titlePopup
            imgView.isHidden = true
            lblContent.attributedText = self.contentPopup
            leftButton.setTitle("", for: .normal) // hidden text only
            leftButton.isEnabled = false
            
            
        case .alertWithImage:
            lblTitle.text = self.titlePopup
            imgView.isHidden = false
            imgIcon.image = self.imagePopup
            lblContent.attributedText = self.contentPopup
            leftButton.setTitle("", for: .normal) // hidden text only
            leftButton.isEnabled = false
            
            
        }
    }
    
}
