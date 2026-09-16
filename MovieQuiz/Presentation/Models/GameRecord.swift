//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Olya on 16.09.2026.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date

    func isBetterThan(_ another: GameRecord) -> Bool {
        correct > another.correct
    }
}
