//
//  BoredAppDependencyContainer.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/29.
//

import Foundation


final class BoredAppDependencyContainer {
    
    // Long-lived dependencies
    let sharedAPIService: APIService

    @discardableResult init() {
        func makeServiceClient() -> APIService { return makeAPIService() }
        func makeAPIService() -> APIService { return APIClient() }
        
        self.sharedAPIService = makeServiceClient()
    }
}

// MARK: - ActivityFactories

extension BoredAppDependencyContainer: ActivityFactory, ActivityViewControllerFactory {

    func makeActivityViewModel() -> ActivityViewModel {
        return ActivityViewModel(service: sharedAPIService)
    }
    
    func makeActivityViewController() -> ActivityViewController {
        ActivityViewController(factory: self)
    }
}
