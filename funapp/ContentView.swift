//
//  ContentView.swift
//  funapp
//
//  Created by vickry on 01/08/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.green, .blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130)

                    Text("Fun App")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 13) {
                        NavigationLink(
                            destination: JokesView(),
                            label: {
                                Text("Jokes")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(30)
                            })
                        
                        NavigationLink(
                            destination: PredictFromNameView(),
                            label: {
                                Text("Predict from Name")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 300, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(30)
                            })
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
