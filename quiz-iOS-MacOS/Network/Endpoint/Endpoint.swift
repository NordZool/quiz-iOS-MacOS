//
//  Endpoint.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//
import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

