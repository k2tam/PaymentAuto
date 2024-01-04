//
//  ViewController.swift
//  ResultScreen
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class ResultVC: UIViewController {
    private let tblViewResult =  UITableView()
    
    lazy var scrollView : VList = VList(scrollviewContentInset: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                                           containerContentInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    private var vm: ResultVM?
    
    private let resultView = ResultView()
    private let resultAddOnView = ResultAddOnView {
        print("Press")
    }
    
    
    init(resultPayment: ResultPayment){
        super.init(nibName: nil, bundle: nil)
        configure(from: resultPayment)
        vm = ResultVM(resultPayment: resultPayment)
    }
    
    private func configure(from resultPayment: ResultPayment){
        resultView.configure(from: resultPayment.resultModel)
        
        //If have add on then show if not hide
        if let addOnResultModel =  resultPayment.addOnResultModel{
            resultAddOnView.isHidden = false
            resultAddOnView.configure(from: addOnResultModel)
        }else {
            resultAddOnView.isHidden = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        setupUI()
    }
    
    
    
    private func setupUI() {
//        view.addSubViews(resultView, resultAddOnView)
        view.addSubview(scrollView)
        scrollView.vStack.spacing = 16
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addItemView(items: [resultView,resultAddOnView])
        
        
        NSLayoutConstraint.activate([

            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
        ])
        
    }
}



