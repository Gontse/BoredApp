//
//  APIClient.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/28.
//

import Foundation
import Combine

final class APIClient: APIService {
    
    func activity() -> AnyPublisher<ActivityResponse, APIError> {
        request(.activity)
    }
    
    // MARK: Privates
    
    private func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        return URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .retry(1)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode)
                else { throw APIError.failedRequest}
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw APIError.invalidResponse
                }
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return .unreachable
                default:
                    return APIError.failedRequest
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
