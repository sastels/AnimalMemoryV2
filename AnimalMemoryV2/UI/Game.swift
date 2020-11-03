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
            playTarget(self.game)
          }
          Spacer()
        }.font(.system(size: 32))

        Board(game: $game)

      }.padding(32)
  }
}

struct Game_Previews: PreviewProvider {
  static var previews: some View {
    Game()
  }
}
