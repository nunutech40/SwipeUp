//
//  FeedBackStarCell.swift
//  BU-Prodia
//
//  Created by mac on 14/6/22.
//

import UIKit
import Cosmos

class FeedBackStarCell: UITableViewCell {
    
    @IBOutlet weak var ratingView: CosmosView!
    
    func configuration() {
        self.ratingView.settings.updateOnTouch = false
        ratingView.settings.fillMode = .full
        ratingView.settings.starSize = 30
        ratingView.settings.starMargin = 5
        ratingView.settings.filledColor = UIColor.orange
        ratingView.settings.emptyBorderColor = UIColor.orange
        ratingView.settings.filledBorderColor = UIColor.orange
        self.ratingView.rating = 3.4
    }
    
}
