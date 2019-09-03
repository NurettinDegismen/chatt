//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Nurettin on 3.09.2019.
//  Copyright © 2019 readknit team. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "chatRoom", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let namee = nameTextField.text
        
        if namee!.isEmpty {
            let alert = UIAlertController(title: "Error!", message: "Nickname can't be empty! ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if namee!.count < 2{
            let alert = UIAlertController(title: "Error!", message: "Nickname can't be less 2 characters! ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if segue.identifier == "chatRoom" {
                if let dis = segue.destination as? ViewController {
                    dis.userName = nameTextField.text
                }
            }
        }
        
        
    }
    
   

}
