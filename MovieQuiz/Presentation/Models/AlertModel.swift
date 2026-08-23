//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Olya on 23.08.2026.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
}
