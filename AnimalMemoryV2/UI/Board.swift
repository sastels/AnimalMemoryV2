//
//  Board.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Board: View {
  @Binding var game: GameData

  var body: some View {
    VStack(spacing: 32) {
      HStack(spacing: 32) {
        Button(action: {
          self.game.pressTile(game.tiles[0].name)
          self.game.tiles[0].toggleState()
      }) {
          Tile(game.tiles[0])
        }

        Button(action: {
          self.game.pressTile(game.tiles[1].name)
          self.game.tiles[1].toggleState()
      }) {
          Tile(game.tiles[1])
        }
      }

      HStack(spacing: 32) {
        Button(action: {
          self.game.pressTile(game.tiles[2].name)
          self.game.tiles[2].toggleState()
        }) {
          Tile(game.tiles[2])
        }
        Button(action: {
          self.game.pressTile(game.tiles[3].name)
          self.game.tiles[3].toggleState()
        }) {
          Tile(game.tiles[3])
        }
      }
    }
  }
}

struct Board_Previews: PreviewProvider {
  @State static var game = GameData(["cat", "dog", "horse", "cow"])

  static var previews: some View {
    Board(game: $game)
  }
}
