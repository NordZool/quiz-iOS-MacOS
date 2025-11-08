//
//  FlexibleGridViewSection.swift
//  quiz-iOS-MacOS
//
//  Created by Никита on 8.11.25.
//


protocol FlexibleGridViewSection : Identifiable {
    associatedtype Cell : FlexibleGridViewCell & Hashable
    
    var title: String { get }
    var cells: [Cell] { get }
}