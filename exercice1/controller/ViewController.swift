//
//  ViewController.swift
//  exercice1
//
//  Created by François Vidal on 07/10/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet private weak var login: UITextField!
    @IBOutlet private weak var password: UITextField!
    @IBOutlet private weak var displayButton : UIButton!
    @IBOutlet private weak var essentialsButton : UIButton!
    @IBOutlet private weak var btnRepo : UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayButton.addTarget(self, action: #selector(connection), for: .touchUpInside)
        essentialsButton.addTarget(self, action: #selector(displayEssentials), for: .touchUpInside)
        btnRepo.addTarget(self, action: #selector(showRepository), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    // redirige vers le profil
    @objc
    func displayGreetings(){
        let secondStoryBoard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let secondViewController = secondStoryBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        if let loginText = login.text {
            secondViewController.login = loginText
        }
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func displayEssentials(){
        
        let listViewStoryBoard = UIStoryboard(name: "RegisterController", bundle: nil)
        let listViewController = listViewStoryBoard.instantiateViewController(withIdentifier: "RegisterController")
        
        navigationController?.pushViewController(listViewController, animated: true)
        
    }
    
    @objc
    func connection() {
        let listUser = UsersList.listUser
        
        for user in listUser {
            if user.getLogin() == login.text && user.getPassword() == password.text{
                displayGreetings()
            } else {
                
            }
        }
    }
    
    @objc
    func showRepository() {
        if let name = login.text {
            let request = AF.request("https://api.github.com/users/\(name)/repos")
            request.responseDecodable(of: [GitHubRepository].self) { response in
                switch response.result {
                case .success:
                    if let repositories = response.value {
                        let message = "Vous n'avez pas de repository public"
                        if repositories.count > 0 {
                            self.displayAlert(title: "Vous avez \(repositories.count) de repositories public", message: "\(repositories[0].name) est l'un de vos repositories")
                        } else {
                            self.displayAlert(title: "Error", message: message)
                        }
                        
                    }
                case.failure:
                        self.displayAlert(title: "Error", message: "\(String(describing:response.error))")
                }
            }
            
        }
        
    }
    
    
}

