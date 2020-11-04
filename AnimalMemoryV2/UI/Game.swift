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
          Text("Best: \(game.maxScore)")
          Spacer()
          Button(game.targetSequence.count == 0 ? "Start" : "Restart") {
            self.game.reset()
            self.game.incrementTarget()
            playTarget()
          }
          Spacer()
        }.font(.system(size: 32))

        Board(game: $game)

      }.padding(32)
  }
  
  func playTarget() {
    print("Target \(game.targetSequence)")
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
        print("\(name) \(delayCopy) on")
      }
      delay += 1.0
      delayCopy = delay
      Timer.scheduledTimer(withTimeInterval: delayCopy, repeats: false) { _ in
        for i in 0..<game.tiles.count {
          if game.tiles[i].name == name {
            game.tiles[i].toggleState()
          }
        }
        print("\(name) \(delayCopy) off")
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
