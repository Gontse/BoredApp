//
//  ActivityViewModel.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/29.
//

import Foundation
import Combine

final class ActivityViewModel {
    
    // MARK: privates
    
    private let service: APIService
    
    // MARK: Reactive properities
    
    @Published private(set) var activity: ActivityDTO?
    @Published private(set) var error: APIError?
    
    // MARK: init
    
    init(service: APIService) {
        self.service = service
    }
    
   // MARK: Internally exposed function(s)
    
    func fetchActivity() {
        let _ = service.activity()
            .sink { data in
                switch data {
                case .finished: break
                case .failure(let error):
                    self.error = error
                }
            } receiveValue: { responseData in
                self.activity = ActivityDTO(activityResponse: responseData)
            }
    }
}

// MARK: - ActivityFactory

protocol ActivityFactory {
   
    func makeActivityViewModel() -> ActivityViewModel
}

