//
//  FeedBackHSView.swift
//  BU-Prodia
//
//  Created by mac on 13/6/22.
//

import UIKit

class FeedBackHSView: UIViewController {
    
    @IBOutlet weak var swipeUpBtn: UIButton!
    @IBOutlet weak var closeBtn: UIImageView!
    @IBOutlet weak var heightViewPopUp: NSLayoutConstraint!
    @IBOutlet weak var popView: UIView!
    
    private var heightFrame = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.heightFrame = screenSize.height
        print("cek heightFrame: \(heightFrame)")
    }
    
    func setupView() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.closeBtn.isUserInteractionEnabled = true
        self.closeBtn.addGestureRecognizer(gesture)
        
        let topRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade))
        topRecognizer.direction = .up
        
        let bottomRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade))
        bottomRecognizer.direction = .down
        
        self.swipeUpBtn.addGestureRecognizer(topRecognizer)
        self.swipeUpBtn.addGestureRecognizer(bottomRecognizer)
        
        self.popView.addGestureRecognizer(topRecognizer)
        self.popView.addGestureRecognizer(bottomRecognizer)
        
    }
    
    func afterSwipe(_ swipe: String) {
        let getHeightFrame = self.heightFrame - 100
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.5, options:
                    .allowUserInteraction,
            animations: {
                if swipe == "up" {
                    self.heightViewPopUp.constant = getHeightFrame
                } else {
                    self.heightViewPopUp.constant = 400
                }
            },
            completion: nil)
    }
    
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .up {
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                options: .allowUserInteraction, animations: {
                    self.view.frame.origin.y -= 75
                },
                completion: {_ in
                    self.afterSwipe("up")
                }
            )
            
        }
        
        if sender.direction == .down {
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                options: .allowUserInteraction, animations: {
                    self.view.frame.origin.y += 75
                },
                completion: {_ in
                    self.afterSwipe("down")
                }
            )
        }
        
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
