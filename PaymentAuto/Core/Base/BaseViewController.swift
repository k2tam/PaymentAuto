//
//  BaseViewController.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation

import UIKit


class BaseViewController : UIViewController{
    var keyboardHeight: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        //debugPrint("---------------\(String(describing: type(of: self))) viewDidLoad-------------")
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    deinit {
        debugPrint("---------------\(String(describing: type(of: self))) disposed-------------")
    }
    
    //MARK: TAIVC sẽ check và trao đổi lại
//    override var navigationController: UINavigationController? {
//        return HiFPTCore.shared.navigationController
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        PopupQueueManager.share().currentKeyScreen = self.screenId ?? ""
////        if PopupQueueManager.share().counter <= 0 {
//            PopupQueueManager.share().startReadQueue()
////        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
protocol BasePopupBottomSheetProtocol{
    func inputContainerView()->UIView
    func callBackActionClose()
}
class BasePopupBottomSheetVC: BaseViewController{
    let durationAnimationTime : Double = 0.32
    var maxY : CGFloat = 0
    var minY : CGFloat = 0
    var center : CGFloat = 0
    var delegate : BasePopupBottomSheetProtocol?
    var callbackClose: (()->Void)?
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        guard let containerView = delegate?.inputContainerView() else {return}
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        containerView.addGestureRecognizer(panGesture)
        
    }
    override func viewDidLayoutSubviews() {
        guard let containerView = delegate?.inputContainerView() else {return}
        minY = containerView.frame.minY
        maxY = containerView.frame.maxY
        center = minY + (maxY - minY)/2.0
    }
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        guard let viewToMove = sender.view else { return }
        let newY = viewToMove.frame.origin.y + translation.y
        if newY >= minY && newY <= maxY {
            viewToMove.frame.origin.y = newY
        }
        if sender.state == .ended {
            if viewToMove.frame.origin.y < center {
                UIView.animate(withDuration:  durationAnimationTime, delay: 0, options: [.curveEaseInOut, .transitionCrossDissolve], animations: {
                    viewToMove.frame.origin.y = self.minY
                })
            } else if viewToMove.frame.origin.y > center {
                UIView.animate(withDuration:  durationAnimationTime, delay: 0, options: [.curveEaseInOut, .transitionCrossDissolve], animations: {
                    viewToMove.frame.origin.y = self.maxY
                    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                }) { [weak self] _ in
                    self?.dismiss(animated: false, completion: {
                        self?.delegate?.callBackActionClose()
                    })
                }
               
            }
            
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
    func dismissPopup(complete:(()->Void)?){
        guard let containerView = delegate?.inputContainerView() else {return}
        containerView.showHidePopup(background: self.view, animationType: .HideBottomTop)
        DispatchQueue.main.asyncAfter(deadline: .now() +  durationAnimationTime ) { [weak self] in
            self?.dismiss(animated: false, completion: {
                complete?()
            })
        }
    }

}
