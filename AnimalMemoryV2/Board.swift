//
//  Board.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Board: View {
  @State var game = GameData(["cat", "dog", "horse", "cow"])

  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        self.game.pressTile(game.tile[0].name)
        self.game.tile[0].toggleState()
      }) {
        Tile(game.tile[0])
      }
      Spacer()
      Button(action: {
        self.game.pressTile(game.tile[1].name)
        self.game.tile[1].toggleState()
      }) {
        Tile(game.tile[1])
      }
      Spacer()
    }
  }
}

struct Board_Previews: PreviewProvider {
  static var previews: some View {
    Board()
  }
}
