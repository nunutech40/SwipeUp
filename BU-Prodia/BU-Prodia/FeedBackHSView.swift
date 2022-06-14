//
//  FeedBackHSView.swift
//  BU-Prodia
//
//  Created by mac on 13/6/22.
//

import UIKit

class FeedBackHSView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
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
        
        tableView.register(UINib(nibName: "FeedBackHeaderCell", bundle: nil), forCellReuseIdentifier: "FeedBackHeaderCell")
        tableView.register(UINib(nibName: "FeedBackScheduleCell", bundle: nil), forCellReuseIdentifier: "FeedBackScheduleCell")
        tableView.register(UINib(nibName: "FeedBackStarCell", bundle: nil), forCellReuseIdentifier: "FeedBackStarCell")
        tableView.register(UINib(nibName: "FeedBackActionCell", bundle: nil), forCellReuseIdentifier: "FeedBackActionCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight             = UITableView.automaticDimension
        tableView.estimatedRowHeight    = 100
        tableView.separatorStyle    = .none
        self.tableView.isScrollEnabled = false
        
    }
    
    func afterSwipe(_ swipe: String) {
        let getHeightFrame = self.heightFrame - 120
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.5, options:
                    .allowUserInteraction,
            animations: {
                if swipe == "up" {
                    self.heightViewPopUp.constant = getHeightFrame
                    self.tableView.isScrollEnabled = true
                } else {
                    self.heightViewPopUp.constant = 511
                    self.tableView.isScrollEnabled = false
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

extension FeedBackHSView: UITableViewDelegate, UITableViewDataSource {
    
   func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackHeaderCell", for: indexPath) as! FeedBackHeaderCell
            cell.configuration()
            return cell
        } else if indexPath.section == 1 {
            let cell1 = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackScheduleCell", for: indexPath) as! FeedBackScheduleCell
            cell1.configuration()
            return cell1
        } else if indexPath.section == 2 {
            let cell2 = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackStarCell", for: indexPath) as! FeedBackStarCell
            cell2.configuration()
            return cell2
        } else {
            let cell3 = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackActionCell", for: indexPath) as! FeedBackActionCell
            cell3.configuration()
            return cell3
        }
        
    }
   
}
