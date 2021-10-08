//
//  SecondViewController.swift
//  exercice1
//
//  Created by François Vidal on 07/10/2021.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private weak var greeetingsLabel: UILabel!
    @IBOutlet private weak var btnLogout: UIButton!
    @IBOutlet private weak var btnInscrit: UIButton!

    public var login: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greeetingsLabel.text = login
        btnLogout.addTarget(self, action: #selector(displayLogin), for: .touchUpInside)
        btnInscrit.addTarget(self, action: #selector(displayInscrit), for: .touchUpInside)

    }
    
    @objc
    func displayLogin() {
        let secondStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = secondStoryBoard.instantiateViewController(withIdentifier: "ViewController")
    
    
        // present(secondViewController, animated: true, completion: nil)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func displayInscrit() {
        let listStoryBoard = UIStoryboard(name: "ListViewController", bundle: nil)
        let listViewController = listStoryBoard.instantiateViewController(withIdentifier: "ListViewController")
    
    
        // present(secondViewController, animated: true, completion: nil)
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
}
