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
        TileButton(color: .red, game: $game, tile: $game.tiles[0])
        TileButton(color: .blue, game: $game, tile: $game.tiles[1])
      }
      HStack(spacing: 32) {
        TileButton(color: .green, game: $game, tile: $game.tiles[2])
        TileButton(color: .purple, game: $game, tile: $game.tiles[3])
      }
    }
  }
}

struct TileButton: View {
  var color: Color
  @Binding var game: GameData
  @Binding var tile: TileData

  var body: some View {
    Button(action: {
      self.game.pressTile(tile.name)
      if self.game.gameState == .success {
        self.game.incrementTarget()
        timerReset(2.0)
        playTarget(2.0)
      } else if self.game.gameState == .failed {
        timerReset(2.0)
      }
  }) {
      Tile(tile, color: color)
    }
  }

  func timerReset(_ delay: Double) {
    Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
      self.game.resetGuess()
    }
  }

  func playTarget(_ delayStart: Double) {
    var delay = delayStart

    for tileIndex in 0..<game.targetSequence.count {
      let delayCopy = delay
      let name = game.targetSequence[tileIndex]
      Timer.scheduledTimer(withTimeInterval: delayCopy, repeats: false) { _ in
        for i in 0..<game.tiles.count {
          if game.tiles[i].name == name {
            game.tiles[i].toggleState()
          }
        }
      }
      delay += 1.0
      let delayCopy2 = delay
      Timer.scheduledTimer(withTimeInterval: delayCopy2, repeats: false) { _ in
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

struct Board_Previews: PreviewProvider {
  @State static var game = GameData(["cat", "dog", "horse", "cow"])

  static var previews: some View {
    Board(game: $game)
  }
}
