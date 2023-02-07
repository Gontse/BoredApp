//
//  APIService.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/28.
//

import Foundation
import Combine

protocol APIService {
    
    func activity() -> AnyPublisher<ActivityResponse, APIError>
}
