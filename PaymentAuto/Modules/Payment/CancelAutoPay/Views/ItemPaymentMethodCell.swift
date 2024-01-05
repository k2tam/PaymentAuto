//
//  ItemPaymentMethodCell.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/3/24.
//

import Foundation
import UIKit
class ItemPaymentMethodCell: UITableViewCell {
    
    var ischeck : Bool = false
    
    var callBackVIscheck: (()->())?
    
    private let vBackground: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 8
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let image: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private let title: UILabel = {
        let l = UILabel()
        l.numberOfLines = 2
        l.font = UIFont.systemFont(ofSize: 16,weight: .light)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        // Configure the cell and add subviews
    }
  
    private func setupUI() {
        self.backgroundColor = .clear
        contentView.addSubview(vBackground)
        
        vBackground.addSubview(title)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap(_:)))
        vBackground.addGestureRecognizer(tapGesture)
        vBackground.addSubview(image)
        layout()

        image.image = UIImage(named: "tickgay")

    }
    @objc func handleImageTap(_ gesture: UITapGestureRecognizer) {
        self.callBackVIscheck?()
        print("tap")
    }
    func setImgae(isCheck: Bool){
        if isCheck == true{
            image.image = UIImage(named: "tickblu")
            vBackground.layer.borderColor = UIColor(hex: "#4564ED").cgColor
            vBackground.layer.borderWidth = 1
        }else{
            image.image = UIImage(named: "tickgay")
            vBackground.layer.borderColor = UIColor.white.cgColor       
        }
    }
    func config(titles: String){
        setLineHeight(label: title, text: titles, lineHeight: 22.4)
    }
    func setLineHeight(label: UILabel, text: String, lineHeight: CGFloat) {
        let attributedString = NSMutableAttributedString(string: text)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight / label.font.lineHeight

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        label.attributedText = attributedString
    }
    private func layout(){
      
        NSLayoutConstraint.activate([
            self.vBackground.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 16),
            self.vBackground.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            self.vBackground.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -16),
            self.vBackground.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.vBackground.heightAnchor.constraint(equalToConstant: 72),

            title.topAnchor.constraint(equalTo: self.vBackground.topAnchor,constant: 12),
            title.bottomAnchor.constraint(equalTo: self.vBackground.bottomAnchor,constant: -12),
            title.leadingAnchor.constraint(equalTo: self.vBackground.leadingAnchor,constant: 12),
            title.trailingAnchor.constraint(equalTo: self.vBackground.trailingAnchor,constant: -12),

            image.trailingAnchor.constraint(equalTo: self.vBackground.trailingAnchor,constant: -16),
            image.centerYAnchor.constraint(equalTo: self.vBackground.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 24),
            image.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
}

