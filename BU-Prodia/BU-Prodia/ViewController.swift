//
//  ViewController.swift
//  BU-Prodia
//
//  Created by mac on 13/6/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn1Act(_ sender: Any) {
        
        let info = FeedBackHSView()
        info.modalPresentationStyle = .overCurrentContext
        self.present(info, animated: true)
        
    }
    
    @IBAction func btn2Act(_ sender: Any) {
        
        let info = FeedBackHSRatingChatView()
        info.modalPresentationStyle = .overCurrentContext
        self.present(info, animated: true)
        
    }
}

