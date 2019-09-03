//
//  ViewController.swift
//  ChatApp
//
//  Created by Nurettin on 2.09.2019.
//  Copyright © 2019 readknit team. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var ref = DatabaseReference.init()
    var userName: String?

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var msgTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        login()
        self.ref = Database.database().reference()
        chatTableView.delegate = self
        chatTableView.dataSource = self

    }
  

    var chatList = [Chat]()
    
    func loadChatRoom() {
        self.ref.child("message").queryOrdered(byChild: "postDate").observe(.value) { (snapshot) in
            self.chatList.removeAll()
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if let postData = snap.value as? [String: AnyObject] {
                        let userName = postData["name"] as? String
                        let text = postData["text"] as? String
                        var postDate: CLong?
                        if let postDateIn = postData["postData"] as? CLong {
                            postDate = postDateIn
                        }
                        
                        self.chatList.append(Chat(userName: userName!, text: text!, datePost: "\(postDate)"))
                    }
                }
                
                self.chatTableView.reloadData()
                let indexPath = IndexPath(row: self.chatList.count - 1, section: 0)
                self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    func login() {
        Auth.auth().signInAnonymously { (user, error) in
            if let error = error {
                print("Sign in failed:", error.localizedDescription)
                
            } else {
                print ("Signed in with uid:", user!.user.uid)
                self.loadChatRoom()
            }
        }
    }
    
    @IBAction func sendButton(_ sender: Any) {
        let dic = ["text": msgTextField.text!, "name": userName!, "postDate": ServerValue.timestamp()] as [String: Any]
        self.ref.child("message").childByAutoId().setValue(dic)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! ChatTableViewCell
        cell.setChat(chat: chatList[indexPath.row])
        return cell
    }

}

