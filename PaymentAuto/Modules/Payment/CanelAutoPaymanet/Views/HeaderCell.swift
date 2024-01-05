//
//  HeaderCell.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/4/24.
//

import Foundation
import UIKit

class HeaderCell: UITableViewHeaderFooterView{
    
    private let title: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 18)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
      
      override init(reuseIdentifier: String?) {
          super.init(reuseIdentifier: reuseIdentifier)
          setupView()
      }

      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setupView()
      }

      func setupView() {
          contentView.addSubview(title)
          contentView.backgroundColor = UIColor(hex: "F5F5F5")
          title.text = "Chọn hình thức thanh toán mới"
          NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 16),
            title.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -16),
          ])
          
      }
}
