//
//  BaseViewController.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/4/24.
//

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
//        self.screenId = ControllerClassName(rawValue: "\(String(describing: type(of: self)))")?.getScreenId() ?? ""
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

