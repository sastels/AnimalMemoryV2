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
        TileButton(game: $game, tile: $game.tiles[0])
        TileButton(game: $game, tile: $game.tiles[1])
      }
      HStack(spacing: 32) {
        TileButton(game: $game, tile: $game.tiles[2])
        TileButton(game: $game, tile: $game.tiles[3])
      }
    }
  }
}

struct TileButton: View {
  @Binding var game: GameData
  @Binding var tile: TileData

  var body: some View {
    Button(action: {
      self.game.pressTile(tile.name)
      tile.toggleState()
  }) {
      Tile(tile)
    }
  }
}

struct Board_Previews: PreviewProvider {
  @State static var game = GameData(["cat", "dog", "horse", "cow"])

  static var previews: some View {
    Board(game: $game)
  }
}
