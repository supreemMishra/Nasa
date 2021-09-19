//
//  Extension.swift
//  Nasa
//
//  Created by Supreem Mishra on 19/09/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: - global method to present alert on view
    @objc func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        alertController.addAction(OKAction)
        self.presentCustomAlert(alertController, animated: true, completion: nil)
    }
    
    func presentCustomAlert(_ alertControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.present(alertControllerToPresent, animated: flag, completion: completion)
        if let _ = alertControllerToPresent as? UIAlertController {
           
        }
    }
}
