//
//  ContentView.swift
//  ikid
//
//  Created by Amelia Li on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            JokeView(joke: "joke1",
                     punchline: "punchline1",
                     punchlineImage: "")
                .tabItem {
                    Image(systemName: "house")
                    Text("Good")
                }
            JokeView(joke: "joke2",
                     punchline: "punchline2",
                     punchlineImage: "")
                .tabItem {
                    Image(systemName: "house")
                    Text("Pun")
                }
            JokeView(joke: "joke3",
                     punchline: "punchline3",
                     punchlineImage: "")
                .tabItem {
                    Image(systemName: "house")
                    Text("Dad")
                }
            KnockKnockView(steps: [
                "Knock knock!",
                "Who's there?",
                "x",
                "x who?",
                "hehehe"
            ])
                .tabItem {
                    Image(systemName: "door.left.hand.open")
                    Text("Knock Knock")
                }
        }

    }
}

struct JokeView: View {
    var joke: String
    var punchline: String
    var punchlineImage: String? = nil

    @State private var revealed = false

    var body: some View {
        VStack {
            Spacer()

            Text(revealed ? punchline : joke)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            if revealed, let imageName = punchlineImage {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding()
                    .transition(.opacity)
            }

            Spacer()

            Button(action: {
                withAnimation {
                    revealed.toggle()
                }
            }) {
                Text(revealed ? "Hide" : "Next")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(
                            colors: [Color.blue, Color.purple]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.horizontal, 40)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 30)
        }
    }
}

struct KnockKnockView: View {
    let steps: [String]
    
    @State private var stepIndex = 0
    @State private var history: [String] = []

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(history, id: \.self) { line in
                        Text(line)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 60)
            }

            Spacer()

            Button(action: {
                if stepIndex < steps.count {
                    history.append(steps[stepIndex])
                    stepIndex += 1
                } else {
                    history = []
                    stepIndex = 0
                }
            }) {
                Text(stepIndex == steps.count ? "Restart" : "Next")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(
                            colors: [Color.blue, Color.purple]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.horizontal, 40)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 30)
        }
    }
}


#Preview {
    ContentView()
}
