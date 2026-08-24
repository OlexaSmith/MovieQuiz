//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Olya on 23.08.2026.
//

import Foundation
final class StatisticService: StatisticServiceProtocol {
    private let storage = UserDefaults.standard
    private enum Keys: String {
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case totalCorrectAnswer
        case totalQuestionsAsked
    }
    var gamesCount: Int {
        get { storage.integer(forKey: Keys.gamesCount.rawValue) }
        set { storage.set(newValue, forKey: Keys.gamesCount.rawValue) }
    }
    var totalQuestionsAsked: Int {
        get { storage.integer(forKey: Keys.totalQuestionsAsked.rawValue) }
        set { storage.set(newValue, forKey: Keys.totalQuestionsAsked.rawValue) }
    }
    var totalAccuracy: Double {
        let correct = storage.integer(forKey: Keys.totalCorrectAnswer.rawValue)
        let questionsAsked = storage.integer(forKey: Keys.totalQuestionsAsked.rawValue)
        guard questionsAsked > 0 else { return 0 }
        return Double(correct) / Double(questionsAsked) * 100
    }
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        let correct = storage.integer(forKey: Keys.totalCorrectAnswer.rawValue)
        storage.set(correct + count, forKey: Keys.totalCorrectAnswer.rawValue)
        let questionAsked = storage.integer(forKey: Keys.totalQuestionsAsked.rawValue)
        storage.set(questionAsked + amount, forKey: Keys.totalQuestionsAsked.rawValue)
        let newGameResult = GameResult(correct: count, total: amount, date: Date())
        if newGameResult.isBetterThan(bestGame) {
            bestGame = newGameResult
        }
    }
}
