//
//  MovieQuizTests.swift
//  MovieQuizTests
//
//  Created by Olya on 11.09.2026.
//


import XCTest 
@testable import MovieQuiz

class ArrayTests: XCTestCase {
    func testGetValueInRange() {
        // Given
        let array = [1, 1, 2, 3, 5]
        // When
        let value = array[safe: 2]
        // Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
    }
    
    func testGetValueOutOfRange() {
        // Given
        let array = [1, 1, 2, 3, 5]
        // When
        let value = array[safe: 20]
        // Then
        XCTAssertNil(value)
    }
}
