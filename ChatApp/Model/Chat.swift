//
//  Chat.swift
//  ChatApp
//
//  Created by Nurettin on 3.09.2019.
//  Copyright © 2019 readknit team. All rights reserved.
//

import UIKit

class Chat: NSObject {
    var userName: String?
    var text: String?
    var datePost: String?
    
    init(userName: String, text: String, datePost: String) {
        self.userName = userName
        self.text = text
        self.datePost = datePost
    }
}
