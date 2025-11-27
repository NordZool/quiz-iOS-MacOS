//
//  NetworkClient.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//
import Foundation

final class NetworkClient: Networking {
    private let baseURL: URL
    private let urlSession: URLSession
    
    static var app: NetworkClient {
        .init(baseURL: URL(string: "http://127.0.0.1:8080")!)
    }
    
    init(baseURL: URL, urlSession: URLSession = .shared) {
        self.baseURL = baseURL
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try makeRequest(endpoint)
        
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
// MARK: - Request builder
extension NetworkClient {
    private func makeRequest(_ endpoint: Endpoint) throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.httpBody = endpoint.body
        
        return request
    }
}
