//
//  NHNOCRViewController.swift
//  OCRCardSample
//
//  Created by wsjung on 1/3/24.
//

import NHNCloudOCR

class NHNConst {
#if DEBUG // developer
    static let APP_KEY = "GTO1QgTS9ylxPFNZ"
#else
    static let APP_KEY = "xDxQlPVjQl85sSQS"
#endif
    
    static let SECRET_KEY = "DNSgUnd16GhyLAib7ismtHrYszOEwnUz"

}

final class NHNOCRViewController: NHNCloudCreditCardRecognizerServiceViewController, NHNCloudCreditCardRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rotateCreditCardGuideOrientation()
        NHNCloudOCR.setCreditCardRecognizerDelegate(self)
        startRunning()
    }
    
    
    
    func didDetect(_ cardInfo: NHNCloudCreditCardInfo?, error: Error?) {
        stopRunning()
        guard let cardInfo else { return }
        print(cardInfo)
    }
    
}

