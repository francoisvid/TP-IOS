//
//  RegisterController.swift
//  exercice1
//
//  Created by François Vidal on 07/10/2021.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet private weak var login: UITextField!
    @IBOutlet private weak var name: UITextField!
    @IBOutlet private weak var password: UITextField!
    @IBOutlet private weak var btnInscription: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnInscription.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
    }
    
    @objc
    func registerUser() {
        let login = login.text!
        let name = name.text!
        let password = password.text!
        let id: Int = UsersList.listUser.count+1

        // verfier si adhérent est déja présent avant de l'ajouter
        addAdherent(id: id, login:login, prenom: name, password: password)
        
        let listStoryBoard = UIStoryboard(name: "ListViewController", bundle: nil)
        let listViewController = listStoryBoard.instantiateViewController(withIdentifier: "ListViewController")
        
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
    // fonction pour ajouter un adherent
    func addAdherent(id: Int, login:String, prenom:String, password:String){
        UsersList.listUser.append(Essential(id : id, login :login, prenom : prenom, password : password))
    }
    
}
