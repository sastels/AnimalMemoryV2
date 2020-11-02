//
//  Board.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Board: View {
  @State var game: GameData

  var body: some View {
    VStack(spacing: 32) {
      HStack(spacing: 32) {
        Button(action: {
          self.game.pressTile(game.tile[0].name)
          self.game.tile[0].toggleState()
      }) {
          Tile(game.tile[0])
        }

        Button(action: {
          self.game.pressTile(game.tile[1].name)
          self.game.tile[1].toggleState()
      }) {
          Tile(game.tile[1])
        }
      }

      HStack(spacing: 32) {
        Button(action: {
          self.game.pressTile(game.tile[2].name)
          self.game.tile[2].toggleState()
        }) {
          Tile(game.tile[2])
        }
        Button(action: {
          self.game.pressTile(game.tile[3].name)
          self.game.tile[3].toggleState()
        }) {
          Tile(game.tile[3])
        }
      }
    }
  }
}

struct Board_Previews: PreviewProvider {
  static var previews: some View {
    Board(game:GameData(["cat", "dog", "horse", "cow"]))
  }
}
