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
        case advice
        case message
        case action
        
        var numberOfItems: Int {
            switch self {
            case .header, .schedule, .star, .headerAdvice, .action, .message:
                return 1
            case .advice:
                return 4
            }
        }
        
    }
}
