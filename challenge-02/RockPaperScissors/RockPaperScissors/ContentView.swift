//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Erik Waterham on 02/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let possibleMoves = ["Rock", "Paper", "Scissors"]

    @State private var appCurrentChoice = 0
    @State private var shouldWin = false

    @State private var playerScore = 0
    @State private var round = 1


    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    if round > 10 {
                    Text("Player score is \(playerScore)")
                        .foregroundColor(.white)
                    } else {
                        Text("Round \(round) of 10")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("App's move: \(possibleMoves[appCurrentChoice])")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Spacer()
                    Text("\(shouldWin ? "Win" : "Loose")")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Spacer()
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.askMove(number)
                        }) {
                            Text("\(self.possibleMoves[number])")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.black)
                        }
                    }
                    Spacer()
                }
            }
        }
    }

    func askMove(_ number: Int) {
        if round > 10 { round = 0 }
        round += 1
        if shouldWin {
            if (appCurrentChoice + 1) % possibleMoves.count == number {
                playerScore += 1
            } else if (appCurrentChoice - 1) % possibleMoves.count == number {
                playerScore -= 1
            }
        } else {
            if (appCurrentChoice - 1) % possibleMoves.count == number {
                playerScore += 1
            } else if (appCurrentChoice + 1) % possibleMoves.count == number {
                playerScore -= 1
            }
        }
        appCurrentChoice = Int.random(in: 0 ..< possibleMoves.count)
        shouldWin = Bool.random()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
