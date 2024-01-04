//
//  ViewController.swift
//  PaymentAuto
//
//  Created by k2 tam on 03/01/2024.
//

import UIKit

class ViewController: UIViewController {
    private let myButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Press Me", for: .normal)
            button.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return button
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
    }

    @objc private func buttonTapped() {
        let CancelAutomaticPayment = CancelAutomaticPayment()
        navigationController?.pushViewController(CancelAutomaticPayment, animated: true)
       }
}

