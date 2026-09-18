//
//  MovieQuizViewControllerMock.swift
//  MovieQuizUITests
//
//  Created by Olya on 18.09.2026.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    
    var lastStepModel: QuizStepViewModel?
    
    func show(quiz step: QuizStepViewModel) {
    
        lastStepModel = step
    }
    
    func show(quiz2 result: QuizResultsViewModel) {
    
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
    
    }
    
    func showLoadingIndicator() {
    
    }
    
    func hideLoadingIndicator() {
    
    }
    
    func showNetworkError(message: String) {
    
    }
}
