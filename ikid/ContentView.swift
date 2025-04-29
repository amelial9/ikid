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
            JokeView(joke: "What's the object-oriented way to become wealthy?",
                     punchline: "Inheritance.",
                     punchlineImage: nil)
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("Good")
                }
            JokeView(joke: "Why do programmers use dark mode?",
                     punchline: "Because light attracts bugs.",
                     punchlineImage: nil)
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Pun")
                }
            JokeView(joke: "Where do dads store all their dad jokes?",
                     punchline: "In the dad-a-base.",
                     punchlineImage: "dad")
                .tabItem {
                    Image(systemName: "mustache")
                    Text("Dad")
                }
            KnockKnockView(steps: [
                "Knock knock!",
                "Who's there?",
                "Yah!",
                "Yah, who?",
                "No not Yahoo, Google."
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
                    .frame(maxWidth: 250, maxHeight: 250)
                    .padding()
                    .transition(.opacity)
            }

            Spacer()

            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        revealed.toggle()
                    }
                }) {
                    Text(revealed ? "Hide" : "Next")
                        .font(.headline)
                        .frame(width: 150)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 30)
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

            HStack {
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
                        .frame(width: 150)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 30)
            }
            .padding(.bottom, 30)
        }
    }
}


#Preview {
    ContentView()
}
