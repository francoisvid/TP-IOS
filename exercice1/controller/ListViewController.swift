//
//  ListViewController.swift
//  exercice1
//
//  Created by François Vidal on 07/10/2021.
//

import Foundation
import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var btnProfil: UIButton!
    @IBOutlet private weak var btnLogout: UIButton!

    private var essentials = [NSManagedObject]()
    private var user = [Essential]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let coreDataContext = AppDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "EssentialEntity")
        
        do {
            essentials = try coreDataContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Error could not retrieve data \(error)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = UsersList.listUser
            
        tableView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "ListViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        btnProfil.addTarget(self, action: #selector(displayProfil), for: .touchUpInside)
        
        btnLogout.addTarget(self, action: #selector(displayLogin), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell") as! ListViewCell
        
        //let title = essentials[indexPath.row].value(forKey: "title")
        //let comments = essentials[indexPath.row].value(forKey: "comments")
        
        //let essential = Essential(title, comments)
        
        cell.setEssential(user: user[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    // hauteur cellule
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
//    func handleEssentialSelection(user: Essential) {
//        let alerteController = UIAlertController(title: user.getLogin(), message: user.getPrenom(), preferredStyle: .alert)
//
//        alerteController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        present(alerteController, animated: true, completion: nil)
//    }
    
    @objc
    func displayProfil() {
        let profilStoryBoard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let profilViewController = profilStoryBoard.instantiateViewController(withIdentifier: "SecondViewController")
    
        navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @objc
    func displayLogin() {
        let loginStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: "ViewController")
    
        navigationController?.pushViewController(loginViewController, animated: false)
    }
    
    @objc
    func reload() {
        let usersStoryBoard = UIStoryboard(name: "ListViewController", bundle: nil)
        let usersViewController = usersStoryBoard.instantiateViewController(withIdentifier: "ListViewController")
    
        navigationController?.pushViewController(usersViewController, animated: true)
        
        tableView.reloadData()
    }

    
}
