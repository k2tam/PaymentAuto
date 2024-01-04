//
//  File.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/3/24.
//

import Foundation
import UIKit

class CancelAutomaticPayment: BaseControllerWithHeaderVC{
    private let tbv: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(hex: "#F5F5F5")
        table.separatorColor = .clear
        table.separatorStyle = .none
        return table
    }()
    private let vFooter: HiBottomViewWithTwoButton = {
        let v = HiBottomViewWithTwoButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    func setupFooter(){
        vFooter.btnPrimary.isEnabled = true
        vFooter.btnPrimary.setTitle("Xác nhận", for: .normal)
        vFooter.btnSecondary.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        vFooter.hideSecondaryButton()
        vFooter.btnSecondary.setTitle("oke", for: .normal)
        
    }
    var arrayCheck: [Int : Bool] = [0:true]
    let data: [YourDataModel] = [
        YourDataModel(title: "Thanh toán Online FPT Telecom (Hi FPT/ Menber FPT/ QR Pay email)", detail: "Detail 1"),
        YourDataModel(title: "Khấu trừ tự động qua ngân hàng", detail: "Detail 2"),
        YourDataModel(title: "Thanh toán qua ngân hàng (ATM/ Chuyển khoản/ SMS...)", detail: "Detail 3"),
        YourDataModel(title: "Qua các ví điện tử Online (VNPay/ VTC/ Moca/ Momo/ TCB Mobile)", detail: "Detail 3"), YourDataModel(title: "Qua các điểm thu hộ (FPT Shop/ Payoo)", detail: "Detail 3"), YourDataModel(title: "Tại quầy giao dịch FPT Telecom", detail: "Detail 3")
        
    ]
    override func setupHeader(){
        super.setupHeader()
        headerView.lblTitle.text = "Hủy đăng ký trả tự động"
        headerView.lblTitle.textColor = UIColor(hex: "#333333")
        headerView.lblTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerView.btnBack.setImage(UIImage(named: "ic_arrow_left_black"), for: .normal)
        headerView.btnRightBarOPtion.isHidden = true
        
    }
    func setupUI(){
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
    func setupTbv(){
        
    }
    func setupVM(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupFooter()
        setupTbv()
        setupUI()
    }
}
extension CancelAutomaticPayment: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as? HeaderCell
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue MyCustomCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemPaymentMethodCell", for: indexPath) as! ItemPaymentMethodCell
       
        cell.callBackVIscheck = { [self] in
            for key in arrayCheck.keys {
                arrayCheck[key] = false
            }
            self.arrayCheck[indexPath.row] = true
            tableView.reloadData()
        }
       
        cell.config(titles: data[indexPath.row].title)
        cell.setImgae(isCheck: arrayCheck[indexPath.row] ?? false)
        cell.selectionStyle = .none
        return cell
    }
    
    
}

struct YourDataModel {
    var title: String
    var detail: String
}
