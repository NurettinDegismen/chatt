//
//  ChatTableViewCell.swift
//  ChatApp
//
//  Created by Nurettin on 3.09.2019.
//  Copyright © 2019 readknit team. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setChat(chat: Chat) {
        userNameLabel.text = chat.userName
        textView.text = chat.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
