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
    var lastResultModel: QuizResultsViewModel?
    var highlightImageBorderCallsCount = 0
    var showLoadingIndicatorCallsCount = 0
    var hideLoadingIndicatorCallsCount = 0
    var lastNetworkErrorMessage: String?
    func show(quiz step: QuizStepViewModel) {
        
        lastStepModel = step
    }
    
    func show(quiz2 result: QuizResultsViewModel) {
        lastResultModel = result
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        highlightImageBorderCallsCount += 1
    }
    
    func showLoadingIndicator() {
        showLoadingIndicatorCallsCount += 1
    }
    
    func hideLoadingIndicator() {
        hideLoadingIndicatorCallsCount += 1
    }
    
    func showNetworkError(message: String) {
        lastNetworkErrorMessage = message
    }
}
