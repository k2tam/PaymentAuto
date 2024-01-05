//
//  BaseNavigation.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
import UIKit
public class BaseNavigation: UINavigationController {
    fileprivate var duringPushAnimation = false
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = self
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
extension BaseNavigation: UIGestureRecognizerDelegate{
    //    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    //        return true
    //    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else {
            return true // default value
        }
        return viewControllers.count > 1 && duringPushAnimation == false
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let swipeNavigationController = navigationController as? BaseNavigation else { return }
        
        swipeNavigationController.duringPushAnimation = false
    }
}
