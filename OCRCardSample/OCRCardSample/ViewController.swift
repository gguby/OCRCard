//
//  ViewController.swift
//  OCRCardSample
//
//  Created by wsjung on 12/28/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let resultsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let scanButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Scan", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        self.view.addSubview(scanButton)
        scanButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        self.view.addSubview(resultsLabel)
        resultsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(scanButton.snp.bottom).offset(20)
        }
        
        scanButton.addTarget(self, action: #selector(scanPaymentCard(sender:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func scanPaymentCard(sender: Any) {
        // Add NSCameraUsageDescription to your Info.plist
        let scannerView = CardScanner.getScanner { card, date, cvv in
            self.resultsLabel.text = "\(card) \(date) \(cvv)"
        }
        present(scannerView, animated: true, completion: nil)
    }
}

#Preview {
    let view = ViewController()
    return view
}
