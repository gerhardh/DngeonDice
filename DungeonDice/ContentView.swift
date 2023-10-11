//
//  ContentView.swift
//  DungeonDice
//
//  Created by Gerhard Heidkamp (dev) on 11.10.23.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...rawValue)
        }
    }

    @State private var resultMessage = ""
    @State private var players = ["Elle", "Mike", "Will", "Lucas", "Sam", "Dustin", "Mike", "Sam", "Will"]

    @State private var gridItems = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
    ]

    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)

            Spacer()

            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(height: 150)

            Spacer()

            LazyVGrid(columns: gridItems) {
                ForEach(Dice.allCases, id: \.self) { dice in
                    Button("\(dice.rawValue)-sided") {
                        resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                }
            .padding()
            }

//            ForEach(Dice.allCases, id: \.self) { dice in
//                Button("\(dice.rawValue)-sided") {
//                    resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
//                }                }
//            .buttonStyle(.borderedProminent)
//            .tint(.red)
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
