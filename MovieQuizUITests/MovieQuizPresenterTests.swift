//
//  MovieQuizPresenterTests.swift
//  MovieQuizUITests
//
//  Created by Olya on 18.09.2026.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock, statisticService: StatisticService(), questionFactory: QuestionFactory(moviesLoader: MoviesLoader(), delegate: nil))
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        sut.didReceiveNextQuestion(question: question)
        let expectation = XCTestExpectation(description: "Wait for show(quiz:) call")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
        
        
        XCTAssertEqual(viewControllerMock.lastStepModel?.image, emptyData)
        XCTAssertEqual(viewControllerMock.lastStepModel?.question, "Question Text")
        XCTAssertEqual(viewControllerMock.lastStepModel?.questionNumber, "1/10")
    }
}
