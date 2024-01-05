//
//  HiThemesPopupManager.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import UIKit
/// HiThemesSDK
public class HiThemesPopupManager{

    private static let myLock = NSLock()
    private static var instance : HiThemesPopupManager?
    
    public static func share() -> HiThemesPopupManager {
        if instance == nil {
            myLock.lock()
            if instance == nil {
                instance = HiThemesPopupManager()
            }
            myLock.unlock()
        }
        return instance ?? HiThemesPopupManager()
        
    }
    
    private init() {
    }
    deinit {
        debugPrint("---------------\(String(describing: type(of: self))) disposed-------------")
    }

//    func presentPopupFullScreenForMarketingVC(vc: UIViewController, eventModel: PopupFullScreenModel?,actionMain:(()->Void)?,  actionClose:(()->Void)? ) {
//
//        guard let eventVC = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupFullScreenForMarketingVC") as? PopupFullScreenForMarketingVC else {return}
//
//        eventVC.eventModel = eventModel
//        eventVC.callbackActionClose = actionClose
//        eventVC.callbackActionMain = actionMain
//        eventVC.modalTransitionStyle = .coverVertical
//        eventVC.modalPresentationStyle = .overFullScreen
//        
//        vc.present(eventVC, animated: true, completion: nil)
//    }

//    public func presentPopupForMarketingWithType(vc: UIViewController, popupType: PopupCustomSizeType,  actionMain:(()->Void)?,callbackActionTapContent:(()->Void)?, actionClose:(()->Void)? ){
//        switch popupType {
//        case .FullScreen(let model):
//            presentPopupFullScreenForMarketingVC(vc: vc, eventModel: model,actionMain: actionMain, actionClose:  actionClose)
//            break
//        case .CenterWithButton,.CenterWithOutButton:
//            let vcPopup = PopupCustomSizeVC(popupType: popupType)
//            vcPopup.callbackActionMain = actionMain
//            vcPopup.callbackActionClose = actionClose
//            vcPopup.callbackActionTapContent = callbackActionTapContent
//            vcPopup.modalPresentationStyle = .overFullScreen
//            vc.present(vcPopup, animated: false)
//            break
//        }
//        
//    }
//    /// Popup with form send note
//    public func presentPopupWithTextBoxVC(vc: UIViewController,typeFeature :PopupTypeFeature = .ParentalControlDeviceName, titlePopup: String,placeholderContent: String,currentContent:String?,errorText: String, errorTextEmpty: String , titleLeftButton: String, actionLeftButton :(()->Void)?,titleRightButton: String, actionRightButton :((String)->Void)?, actionClose:(()->Void)? ){
//
//        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupWithTextBoxVC") as? PopupWithTextBoxVC else {return}
//        vcPopup.setupUIWithRawData(typeFeature: typeFeature,
//                                   title: titlePopup,
//                                   currentContent: currentContent,
//                                   placeHolder: placeholderContent,
//                                   errorText: errorText,
//                                   errorTextEmpty: errorTextEmpty ,
//                                   titleLeftBtn: titleLeftButton ,
//                                   titleRightBtn: titleRightButton,
//                                   actionLeftBtn: actionLeftButton,
//                                   actionRightBtn: actionRightButton)
//        vcPopup.modalPresentationStyle = .overFullScreen
//        vc.present(vcPopup, animated: false)
//    }
 /// Popup with form send note
//    public func presentPopupSendNoteVC(vc: UIViewController, titlePopup: String,placeholderContent: String,currentContent:String?, titleButton: String, actionButton :((String)->Void)?, actionClose:(()->Void)? ){
//
//        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupSendNoteVC") as? PopupSendNoteVC else {return}
//        vcPopup.titlePopup = titlePopup
//        vcPopup.titleButton = titleButton
//        vcPopup.placeHolderTextView = placeholderContent
//        vcPopup.currentContent = currentContent
//        vcPopup.callbackActionPrimary = actionButton
//        vcPopup.callbackClosePopup = actionClose
//        vcPopup.modalPresentationStyle = .overFullScreen
//        vc.present(vcPopup, animated: false)
//    }
    
   
    

    /// popup common ( title , content , 2 button , image)
    public func presentToPopupVC(vc:UIViewController,
                                 type: HiThemesPopupType,
                                 isCountdown : Bool = false,
                                 countdownTime : Int = 5,
                                 isShowBtnClose: Bool = true,
                                 actionClose : (()->Void)? = nil){
        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else {return}
        vcPopup.isCountdown = isCountdown
        vcPopup.countdownTime = countdownTime
        vcPopup.setupUI(popupType: type, isShowBtnClose: isShowBtnClose, actionClose: actionClose)
        vcPopup.modalPresentationStyle = .overFullScreen
         vc.present(vcPopup, animated: false)
    }
    
    /// - Parameters:
    ///   - image: = nil -> hidden
    ///   - titleLeftBtn: == nil -> left button hidden + right button change full width, == "" > left button hidden + right button not change
    public func presentToPopupVCWithRawData(vc:UIViewController,
                                            title: String,
                                            content: NSMutableAttributedString,
                                            image : UIImage?,
                                            isCountdown : Bool = false,
                                            countdownTime : Int = 5,
                                            titleLeftBtn: String?,
                                            titleRightBtn: String,
                                            actionLeftBtn: (()->Void)?,
                                            actionRightBtn: @escaping (()->Void),
                                            actionClose : (()->Void)? = nil){
        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupVC") as? PopupVC else {return}
        vcPopup.isCountdown = isCountdown
        vcPopup.countdownTime = countdownTime
        vcPopup.setupUIWithRawData(title: title,
                                   content: content,
                                   image: image,
                                   titleLeftBtn: titleLeftBtn,
                                   titleRightBtn: titleRightBtn,
                                   actionLeftBtn: actionLeftBtn,
                                   actionRightBtn: actionRightBtn,
                                   actionClose: actionClose)
        
        vcPopup.modalPresentationStyle = .overFullScreen
         vc.present(vcPopup, animated: false)
    }
//    /// popup with image big size ( title , content , 2 button , image)
//    public func presentToPopupWithImageVC(vc:UIViewController,
//                                          titlePopup: String,
//                                          contentPopup: NSMutableAttributedString,
//                                          imagePopup: UIImage,
//                                          rightBtnTitle: String){
//        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupWithImageVC") as? PopupWithImageVC else {return}
//        vcPopup.setupDataUI(titlePopup: titlePopup,
//                            contentPopup: contentPopup,
//                            imagePopup: imagePopup,
//                            rightBtnTitle: rightBtnTitle)
//        vcPopup.modalPresentationStyle = .overFullScreen
//         vc.present(vcPopup, animated: false)
//    }
//    public func presentToPopupSystemWithListItemVC(vc:UIViewController,
//                                             uiModel: DataUIPopupWithListModel,
//                                             listItem : [HiThemesImageTitleIconProtocol],
////                                             indexOfItemSelected : Int?,
//                                             callbackClosePopup : (()->Void)?,
//                                             callbackDidSelectItem:((Int)->Void)?,
//                                             callbackActionLeftButton : (()->Void)? = nil,
//                                             callbackActionRightButton : ((Int?)->Void)? = nil,
//                                             callbackActionRightButtonWithMultiSelect : (([Int]?)->Void)? = nil){
//        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupSystemWithListItemVC") as? PopupSystemWithListItemVC else {return}
//        vcPopup.dataUIPopupModel = uiModel
//        vcPopup.listData = listItem
////        vcPopup.currentIndexSelected = indexOfItemSelected
//        vcPopup.callbackClosePopup = callbackClosePopup
//        vcPopup.callbackDidSelectItem =  callbackDidSelectItem
//        vcPopup.callbackActionLeftButton = callbackActionLeftButton
//        vcPopup.callbackActionRightButton = callbackActionRightButton
//        vcPopup.callbackActionRightButtonWithMultiSelect = callbackActionRightButtonWithMultiSelect
//        vcPopup.modalPresentationStyle = .overFullScreen
//        vc.present(vcPopup, animated: false)
//    }
//    
//    public func presentToPopupTimePickerVC(vc:UIViewController,
//                                           titlePopup : NSMutableAttributedString?,
//                                           titleRightButton : String,
//                                           datePickerMode : UIDatePicker.Mode,
//                                           initDate : DateComponents? = nil,
//                                             callbackClosePopup : (()->Void)?,
//                                             callbackActionRightButton : ((Date)->Void)? = nil){
//        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupTimePickerVC") as? PopupTimePickerVC else {return}
//        vcPopup.titlePopup = titlePopup
//        vcPopup.titleRightButton = titleRightButton
//        vcPopup.datePickerMode = datePickerMode
//        vcPopup.initDate = initDate
//        vcPopup.callbackClosePopup = callbackClosePopup
//        vcPopup.callbackActionRightButton = callbackActionRightButton
//        vcPopup.modalPresentationStyle = .overFullScreen
//        vc.present(vcPopup, animated: false)
//    }
//    public func presentToPopupWithCustomContentVC(vc:UIViewController,
//                                                  contentView: UIView,
//                                                  callbackClosePopup : (()->Void)?){
//        guard let vcPopup = UIStoryboard(name: "Popup", bundle: Bundle(for: HiThemesPopupManager.self)).instantiateViewController(withIdentifier: "PopupWithCustomContentVC") as? PopupWithCustomContentVC else {return}
//        vcPopup.contentInputView = contentView
//        vcPopup.callbackClosePopup = callbackClosePopup
//        vcPopup.modalPresentationStyle = .overFullScreen
//        vc.present(vcPopup, animated: false)
//    }
//    
//    
//    public func presentDatePickerPopup(
//        vc: UIViewController,
//        inputDate: Date? = nil,
//        onSuccess: @escaping (_ date: Date) -> Void
//    ) {
//        guard let dateVC = UIStoryboard(name: "PopupDatePickerVC", bundle: Bundle(for: Self.self)).instantiateViewController(withIdentifier: "PopupDatePickerVC") as? PopupDatePickerVC else { return }
//        dateVC.modalPresentationStyle = .overFullScreen
//        dateVC.config(inputDate: inputDate, actionDone: onSuccess)
//        vc.present(dateVC, animated: false) {
//            dateVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        }
//    }
    
    public enum ToastType {
        case success, fail
    }
    
    public func showToast(
        vc: UIViewController,
        message : String,
        font: UIFont = UIFont.systemFont(ofSize: 16, weight: .medium),
        constrainBottom: Float = 60,
        duration: Double = 1,
        completion: @escaping () -> Void = {}
    ) {
        let termView = UIView()
        vc.view.addSubview(termView)
        termView.translatesAutoresizingMaskIntoConstraints = false
        termView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //add shadow
        termView.layer.shadowColor  = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        termView.layer.shadowOpacity = 1
        termView.layer.shadowRadius = 10
        termView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        let toastLabel = UILabel()
        toastLabel.backgroundColor = .clear
        toastLabel.textColor = UIColor.black
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        termView.addSubview(toastLabel)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toastLabel.leadingAnchor.constraint(equalTo: termView.leadingAnchor, constant : 16),
            toastLabel.trailingAnchor.constraint(equalTo: termView.trailingAnchor, constant : -16),
            toastLabel.centerXAnchor.constraint(equalTo: termView.centerXAnchor),
            toastLabel.topAnchor.constraint(equalTo: termView.topAnchor, constant : 12),
            toastLabel.bottomAnchor.constraint(equalTo: termView.bottomAnchor, constant : -12),
        ])
       
        NSLayoutConstraint.activate([
            termView.leadingAnchor.constraint(greaterThanOrEqualTo: vc.view.leadingAnchor, constant : 12),
            termView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            termView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor, constant : -110),
        ])
        
        termView.layoutIfNeeded()
        termView.layer.cornerRadius = (termView.frame.height / 2);

        
        UIView.animate(withDuration: 1, delay: 3, options: .curveEaseOut, animations: {
            termView.alpha = 0.0
        }, completion: {(isCompleted) in
            termView.removeFromSuperview()
            completion()
        })
    }
    
    public func showToast(
        vc: UIViewController,
        message : String,
        font: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular),
        constrainBottom: Float = 60,
        duration: Double = 1,
        type: ToastType,
        completion: @escaping () -> Void = {}
    ) {
        
        let toastView = UIView()
        vc.view.addSubview(toastView)
        toastView.translatesAutoresizingMaskIntoConstraints = false
        
        //add shadow
        toastView.layer.shadowColor  = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        toastView.layer.shadowRadius = 8
        toastView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        if type == .success {
            toastView.backgroundColor = UIColor(red: 0.439, green: 0.753, blue: 0.302, alpha: 1)
        } else {
            toastView.backgroundColor = UIColor(red: 0.965, green: 0.251, blue: 0.361, alpha: 0.64)
        }
        toastView.layer.cornerRadius = 10;
        
        // label
        let toastLabel = UILabel()
        toastLabel.backgroundColor = .clear
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .left;
        toastLabel.text = "  " + message + "  "
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        // image view
        let toastImage = UIImage(named: type == .success ? "ic_toast_success" : "ic_toast_fail")
        let toastImv = UIImageView(image: toastImage)
        
        toastView.addSubview(toastLabel)
        toastView.addSubview(toastImv)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastImv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toastLabel.leadingAnchor.constraint(equalTo: toastView.leadingAnchor, constant : 16),
            toastLabel.trailingAnchor.constraint(equalTo: toastImv.leadingAnchor, constant: 2),
            toastLabel.topAnchor.constraint(equalTo: toastView.topAnchor, constant : 14),
            toastLabel.bottomAnchor.constraint(equalTo: toastView.bottomAnchor, constant : -14),
            
            toastImv.centerYAnchor.constraint(equalTo: toastLabel.centerYAnchor),
            toastImv.heightAnchor.constraint(equalToConstant: 24),
            toastImv.widthAnchor.constraint(equalTo: toastImv.heightAnchor, multiplier: 1),
            toastImv.trailingAnchor.constraint(equalTo: toastView.trailingAnchor, constant: -16)
        ])
       
        NSLayoutConstraint.activate([
            toastView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant : 32),
            toastView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant : -32),
            toastView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor, constant : CGFloat(-constrainBottom)),
        ])
        
        UIView.animate(withDuration: 1, delay: TimeInterval(duration), options: .curveEaseOut, animations: {
            toastView.alpha = 0.0
        }, completion: {(isCompleted) in
            completion()
            toastView.removeFromSuperview()
        })
    }
}

