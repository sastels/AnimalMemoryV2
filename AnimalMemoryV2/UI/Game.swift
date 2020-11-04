//
//  Game.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Game: View {
  @State var game = GameData(["cat", "dog", "cow", "horse"])

  var body: some View {
    return
      VStack(spacing: 32) {
        HStack(spacing: 16) {
          Spacer()
          Button(game.targetSequence.count == 0 ? "Start" : "Replay") {
            if game.targetSequence.count == 0 {
              self.game.reset()
              self.game.incrementTarget()
            }
            self.game.resetGuess()
            playTarget()
          }
          Spacer()
          Text("Best: \(game.maxScore)")
          Spacer()
          Button(game.targetSequence.count == 0 ? "Start" : "Restart") {
            self.game.reset()
            self.game.incrementTarget()
            playTarget()
          }
          Spacer()
        }.font(.system(size: 32))

        ZStack {
          Board(game: $game)
          if game.gameState != .notDone {
            Text(game.gameState == .success ? "Good Job!" : "Try again!")
              .font(.system(size: 60))
              .foregroundColor(.black)
              .padding(50)
              .frame(
                alignment: .center)
              .background(RoundedRectangle(cornerRadius: 25).fill(Color.white).shadow(radius: 3))
          }
        }
      }.padding(32)
  }

  func playTarget() {
    var delay = 0.0

    for tileIndex in 0..<game.targetSequence.count {
      var delayCopy = delay
      let name = game.targetSequence[tileIndex]
      Timer.scheduledTimer(withTimeInterval: delayCopy, repeats: false) { _ in
        for i in 0..<game.tiles.count {
          if game.tiles[i].name == name {
            game.tiles[i].toggleState()
          }
        }
      }
      delay += 1.0
      delayCopy = delay
      Timer.scheduledTimer(withTimeInterval: delayCopy, repeats: false) { _ in
        for i in 0..<game.tiles.count {
          if game.tiles[i].name == name {
            game.tiles[i].toggleState()
          }
        }
      }
      delay += 0.2
    }
  }
}

struct Game_Previews: PreviewProvider {
  static var previews: some View {
    Game()
  }
}
