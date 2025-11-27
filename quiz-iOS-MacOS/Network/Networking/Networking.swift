//
//  Networking.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//


protocol Networking {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
    func request(_ endpoint: Endpoint) async throws
}
