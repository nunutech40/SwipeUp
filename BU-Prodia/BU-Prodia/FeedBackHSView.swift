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
    private var sections = [FeedBackViewModel.Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.heightFrame = screenSize.height
        print("cek constraint tableheight: \(self.tableView.frame.height)")
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
        tableView.register(UINib(nibName: "FeedBackHeaderAdviceCell", bundle: nil), forCellReuseIdentifier: "FeedBackHeaderAdviceCell")
        tableView.register(UINib(nibName: "FeedBackAdviceCell", bundle: nil), forCellReuseIdentifier: "FeedBackAdviceCell")
        tableView.register(UINib(nibName: "FeedBackMessageCell", bundle: nil), forCellReuseIdentifier: "FeedBackMessageCell")
        tableView.register(UINib(nibName: "FeedBackActionCell", bundle: nil), forCellReuseIdentifier: "FeedBackActionCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.configureDisplayData(swipe: "default")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight             = UITableView.automaticDimension
        tableView.separatorStyle    = .none
        self.tableView.isScrollEnabled = false
        
    }
    
    private func configureDisplayData(swipe: String) {
        var sections = [FeedBackViewModel.Section]()
        sections.append(.header)
        sections.append(.schedule)
        sections.append(.star)
        
        if swipe == "up" {
            sections.append(.headerAdvice)
            sections.append(.advice)
            sections.append(.message)
        } else {
            if swipe == "down" {
                if self.sections.count > 4 {
                    self.sections.remove(at: 3)
                    self.sections.remove(at: 4)
                    self.sections.remove(at: 5)
                }
            }
        }
        sections.append(.action)
        self.sections = sections
        self.tableView.reloadData()
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
                    self.configureDisplayData(swipe: "up")
                } else {
                    self.heightViewPopUp.constant = 511
                    self.tableView.isScrollEnabled = false
                    self.configureDisplayData(swipe: "down")
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
       return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections[indexPath.section] {
            
        case .header:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackHeaderCell", for: indexPath) as! FeedBackHeaderCell
            cell.configuration()
            return cell
        case .schedule:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackScheduleCell", for: indexPath) as! FeedBackScheduleCell
            cell.configuration()
            return cell
        case .star:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackStarCell", for: indexPath) as! FeedBackStarCell
            cell.configuration()
            return cell
        case .headerAdvice:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackHeaderAdviceCell", for: indexPath) as! FeedBackHeaderAdviceCell
            cell.configuration()
            return cell
        case .advice:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackAdviceCell", for: indexPath) as! FeedBackAdviceCell
            cell.configuration()
            return cell
        case .message:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackMessageCell", for: indexPath) as! FeedBackMessageCell
            cell.configuration()
            return cell
        case .action:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeedBackActionCell", for: indexPath) as! FeedBackActionCell
            cell.configuration()
            return cell
        
        }
    }
    
}
