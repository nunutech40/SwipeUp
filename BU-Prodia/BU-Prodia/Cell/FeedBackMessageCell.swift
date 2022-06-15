//
//  FeedBackMessageCell.swift
//  BU-Prodia
//
//  Created by mac on 15/6/22.
//

import UIKit

class FeedBackMessageCell: UITableViewCell {

    @IBOutlet weak var messageText: UITextView!
    
    func configuration() {
        setupView()
    }
    
    func setupView() {
        self.selectionStyle = .none
        self.messageText.layer.borderWidth = 1
        self.messageText.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
