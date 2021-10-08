//
//  ListViewCell.swift
//  exercice1
//
//  Created by François Vidal on 07/10/2021.
//

import Foundation
import UIKit

protocol ListViewCellDelegate {
    func handleEssentialSelection(user: Essential)
}

class ListViewCell: UITableViewCell {
    
    @IBOutlet private weak var userLabel: UILabel!
    @IBOutlet private weak var btnRemove: UIButton!

    //private var user = Essential(login: "", prenom: "", password: "")
    var delegate: ListViewCellDelegate?

    // viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnRemove.addTarget(self, action: #selector(removeUser), for: .touchUpInside)
        //let tap = UITapGestureRecognizer(target: self, action: #selector(handleCellTap))
        //addGestureRecognizer(tap)
    }
    
//    @objc
//    func handleCellTap() {
//        delegate?.handleEssentialSelection(user: user)
//    }
    
    
    func setEssential(user: Essential) {
        //self.user = user
        userLabel.text = user.getLogin() + " " + user.getPrenom()
    }
    
    // fonction pour supprimer un adherent
    @objc func removeUser(){
        UsersList.listUser.remove(at: 1)
    }
    
}
