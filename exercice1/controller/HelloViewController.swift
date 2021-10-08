//
//  HelloViewController.swift
//  exercice1
//
//  Created by François Vidal on 08/10/2021.
//

import Foundation
import UIKit
import CoreData

class HelloViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1 - créer la vue
        // 2 - mapper les données et éléments
        // 3 - récupérer les données et les stockers dans des variables
        // 4 - appeler la fonction saveEssentials depuis le click sur le bouton
        
    }
    
    @objc
    func saveEssentials() {
        // view contexte permet d'enregistrer en bdd
        let coreDataContest = AppDelegate.persistentContainer.viewContext
        let essentialEntity = NSEntityDescription.entity(forEntityName: "EssentialEntity", in: coreDataContest)!
        let essentialObject = NSManagedObject(entity: essentialEntity, insertInto: coreDataContest)
        // essentialObject.setValue(nameTextField.text, forKey: "title")
        // essentialObject.setValue(commentsTextField.text, forKey: "comments")
        do {
            try coreDataContest.save()
            displayAlert(title: "Success", message: "ok")
        } catch let error as NSError {
            print("Error could not save data \(error)")
        }
    }
}
