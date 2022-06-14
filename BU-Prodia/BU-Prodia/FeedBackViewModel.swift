//
//  FeedBackViewModel.swift
//  BU-Prodia
//
//  Created by mac on 15/6/22.
//

import Foundation
class FeedBackViewModel {
    
    enum Section {
        case header
        case schedule
        case star
        case headerAdvice
        case action
        
        var numberOfItems: Int {
            switch self {
            case .header, .schedule, .star, .headerAdvice, .action:
                return 1
            }
        }
        
    }
}
