//
//  Codable+Extensions.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 27.11.25.
//
import Foundation

extension Encodable {
    var encoded: Data? {
        try? JSONEncoder().encode(self)
    }
}
