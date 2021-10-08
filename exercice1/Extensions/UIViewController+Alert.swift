//
//  UIViewController+Alert.swift
//  exercice1
//
//  Created by François Vidal on 08/10/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
