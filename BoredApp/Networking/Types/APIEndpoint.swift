//
//  APIEndpoint.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/28.
//

import Foundation

enum APIEndpoint {
    
    case activity
    
    private var headers: Headers {
        let headers = ["Content-Type" : "application/json"]
        return headers
    }
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.addHeaders(headers)
        request.httpMethod = httpMethod.rawValue
        
        return request
    }
    
    private var url: URL {
        return Environment.apiBaseURL.appendingPathComponent(path)
    }
    
    private var path: String {
        switch self {
        case .activity:
            return "activity"
        }
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        case .activity:
            return .get
        }
    }
}

// MARK: - URLRequest

fileprivate extension URLRequest {
    
    mutating func addHeaders(_ headers: Headers) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
}
