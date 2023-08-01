//
//  PredictFromNameView.swift
//  funapp
//
//  Created by vickry on 01/08/23.
//

import SwiftUI

struct PredictFromNameView: View {
    @State var name = ""
    @State var predictAge: PredictAge?
    @State var predictGender: PredictGender?

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .frame(width: .infinity)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding()
            
            
            Spacer()
            
            if let age = predictAge?.age {
                Text("\(age)")
                    .font(.title)
                    .bold()
                Text(predictGender?.gender?.capitalized ?? "")
                    .bold()
            }
            
            Spacer()
            
            Button(action: {
                fetchPredictAge()
                fetchPredictGender()
            }, label: {
                Text("Predict Age and Gender")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
            })
        }.navigationTitle("Predict")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func fetchPredictAge(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.agify.io"
        components.queryItems = [
            URLQueryItem(name: "name", value: name)
        ]
        
        URLSession.shared.dataTask(with: components.url!) { data, _, error in

            guard let data = data, error != nil else {
                print("Error: Empty data")
                return
            }
            
            do {
                let predictAge = try JSONDecoder().decode(PredictAge.self, from: data)
                
                DispatchQueue.main.async {
                    self.predictAge = predictAge
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchPredictGender(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.genderize.io"
        components.queryItems = [
            URLQueryItem(name: "name", value: name)
        ]
        
        URLSession.shared.dataTask(with: components.url!) { data, _, error in
            guard let data = data, error != nil else {
                print("Error: Empty data")
                return
            }
            
            do {
                let predictGender = try JSONDecoder().decode(PredictGender.self, from: data)
                
                DispatchQueue.main.async {
                    self.predictGender = predictGender
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct PredictFromNameView_Previews: PreviewProvider {
    static var previews: some View {
        PredictFromNameView()
    }
}
