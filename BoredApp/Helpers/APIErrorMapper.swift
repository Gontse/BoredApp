//
//  APIErrorMapper.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/28.
//

import Foundation

struct APIErrorMapper {
    
    enum Context {
        case activity
    }

    let error: APIError
    let context: Context
    
    var message: String {
        switch error {
        case .unreachable:
            return "You need to have a network connect."
        case .failedRequest,
                .unknown,
                .invalidResponse:
            switch context {
            case .activity:
                return "Activity could not be fetched."
            }
        }
    }
}
