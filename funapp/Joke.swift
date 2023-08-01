//
//  Jokes.swift
//  funapp
//
//  Created by vickry on 01/08/23.
//

import Foundation

struct Joke: Codable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}
