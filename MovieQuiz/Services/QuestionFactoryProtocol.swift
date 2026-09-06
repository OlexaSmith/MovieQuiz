//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Olya on 21.08.2026.
//

import Foundation

protocol QuestionFactoryProtocol {
    var delegate: QuestionFactoryDelegate? { get set }
    func requestNextQuestion()
    func loadData()
}
