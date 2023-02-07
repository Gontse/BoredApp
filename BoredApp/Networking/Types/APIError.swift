//
//  APIError.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/28.
//

import Foundation

enum APIError: Error {
    
    case unknown
    case unreachable
    case failedRequest
    case invalidResponse
}
