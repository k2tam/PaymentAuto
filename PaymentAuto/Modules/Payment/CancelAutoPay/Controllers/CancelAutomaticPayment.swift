//
//  File.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/3/24.
//

import Foundation
import UIKit

class CancelAutomaticPayment: BaseControllerWithHeaderVC{
    
    var vm: PaymentMethodsVM?
    
    private let tbv: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(hex: "#F5F5F5")
        table.separatorColor = .clear
        table.separatorStyle = .none
        return table
    }()
    func setUpVM(){
        vm = PaymentMethodsVM()
        
        vm?.fetchData(vc: self)
    }
    private let vFooter: HiBottomView = {
        let v = HiBottomView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    func setupFooter(){
        vFooter.btnPrimary.isEnabled = true
        vFooter.btnPrimary.setTitle("Xác nhận", for: .normal)
        vFooter.callbackActionButton = {
            [weak self] in
            guard let self = self else{
                return
            }
            self.vm?.tapOnConfirmButton(vc: self)
        }

    }
    var arrayCheck: [Int : Bool] = [0:true]

    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Hủy đăng ký trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        headerView.btnRightBarOPtion.isHidden = true
    }
    func setupUI(){
        
    }
    func setupTbv(){
        self.view.addSubview(tbv)
        view.addSubview(vFooter)
        tbv.register(ItemPaymentMethodCell.self, forCellReuseIdentifier: "ItemPaymentMethodCell")
        tbv.register(HeaderCell.self, forHeaderFooterViewReuseIdentifier: "HeaderCell")
        
        tbv.delegate = self
        tbv.dataSource = self
        NSLayoutConstraint.activate([
            tbv.topAnchor.constraint(equalTo: self.headerView.bottomAnchor,constant: 0),
            tbv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tbv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tbv.bottomAnchor.constraint(equalTo: self.vFooter.topAnchor,constant: 0),
            
            self.vFooter.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.vFooter.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.vFooter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.vFooter.heightAnchor.constraint(equalTo: self.vFooter.widthAnchor, multiplier: 80/414)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVM()
        setupHeader()
        setupFooter()
        setupTbv()
        setupUI()
    }
}
extension CancelAutomaticPayment: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.vm?.items.count ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as? HeaderCell
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemPaymentMethodCell", for: indexPath) as! ItemPaymentMethodCell
       
        cell.callBackVIscheck = { [self] in
            for key in arrayCheck.keys {
                arrayCheck[key] = false
            }
            self.arrayCheck[indexPath.row] = true
            tableView.reloadData()
        }
        
        cell.config(titles: vm?.items[indexPath.row].content ?? "")
        cell.setImgae(isCheck: arrayCheck[indexPath.row] ?? false)
        if arrayCheck[indexPath.row] == true {
            self.vm?.setSelectedMethod(atIndex: indexPath.row)
        }
        cell.selectionStyle = .none
        return cell
    }
}
