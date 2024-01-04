//
//  FileBaseControllerWithHeaderVC.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/4/24.
//

import UIKit
class BaseControllerWithHeaderVC: BaseViewController {
    var backgroundHeader : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var headerView : HiNewHeaderView = {
     let v = HiNewHeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let WIDTH_HEIGHT_RATIO : CGFloat = 56.0/375.0 // goc 56.0/375.0 ti le header voi man hinh
    private var headerHeight : CGFloat = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
    }
    
    private func setConstraintHeader(){
        self.view.addSubview(backgroundHeader)
        self.view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -headerHeight),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: WIDTH_HEIGHT_RATIO)
        ])
        NSLayoutConstraint.activate([
            backgroundHeader.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundHeader.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])
    }
    internal func setupHeader(){
        headerHeight = self.view.bounds.width*WIDTH_HEIGHT_RATIO
        setConstraintHeader()
        self.additionalSafeAreaInsets = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        self.backgroundHeader.backgroundColor = MyGlobal.shared().myThemes.getHeaderBackgroundColor()
        self.headerView.backgroundColor = .clear
    }
}

