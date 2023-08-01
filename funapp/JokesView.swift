//
//  JokesView.swift
//  funapp
//
//  Created by vickry on 01/08/23.
//

import SwiftUI

struct JokesView: View {
    @State var joke: Joke?

    var body: some View {
        VStack(spacing: 20) {
            Text(joke?.setup ?? "")
                .multilineTextAlignment(.center)

            Text(joke?.punchline ?? "")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .bold, design: .default))
            
            Button(action: {
                fetchJoke()
            }, label: {
                Text("Random Joke")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
            })
        }
        .navigationTitle("Joke")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func fetchJoke() {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            print("Error: Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error.localizedDescription)
                return
            }

            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                
                DispatchQueue.main.async {
                    self.joke = joke
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}

struct JokesView_Previews: PreviewProvider {
    static var previews: some View {
        JokesView()
    }
}
