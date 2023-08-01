//
//  PredictName.swift
//  funapp
//
//  Created by vickry on 01/08/23.
//

import Foundation

struct PredictAge: Codable {
    let count: Int
    let name: String
    var age: Int?
}


struct PredictGender: Codable {
    let count: Int
    let name: String
    let gender: String?
    let probability: Float
}
