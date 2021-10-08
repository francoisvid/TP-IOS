//
//  Essential.swift
//  exercice1
//
//  Created by François Vidal on 07/10/2021.
//

import Foundation

class Essential {
    
    private var id : Int
    private var login : String
    private var prenom : String
    private var password : String
 
    init(id: Int, login: String, prenom: String, password:String)
    {
        self.id = id
        self.login = login
        self.prenom = prenom
        self.password = password
    }
    // getter
    func getId() -> Int {
        return self.id
    }
    
    func setId(id :Int){
        self.id = id
    }
    
    func getLogin() -> String {
        return self.login
    }
    
    func getPrenom() -> String {
        return self.prenom
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    // setter
    func setPrenom(prenom :String){
        self.prenom = prenom
    }
    
    func setLogin(login :String){
        self.login = login
    }
    
    func setPrenom(password :String){
        self.password = password
    }

    // display
    func display() -> String
    {
        return "Nom : \(self.login)  \(self.prenom)"
    }

}
