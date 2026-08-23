//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Olya on 22.08.2026.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               
    func didReceiveNextQuestion(question: QuizQuestion?)
}
