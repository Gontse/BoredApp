//
//  ActivityResponse.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/28.
//

import Foundation

struct ActivityResponse: Decodable {
    
    let activity: String
    let type: String
    let participants: Int
    let price: Int
    let link: String
    let key: String
    let accessibility: Double
}

// MARK: - DTO

struct ActivityDTO {
    
    // MARK:  Privates
    
    private let activityResponse: ActivityResponse
    
    // MARK:  init
    
    init(activityResponse: ActivityResponse) {
        self.activityResponse = activityResponse
    }
    
    // MARK: Internally exposed
    
    var activity: String {
        return activityResponse.activity
    }
    
    var category: String{
        return activityResponse.type
    }
}
