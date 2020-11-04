//
//  Board.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Board: View {
  @Binding var game: GameData
  @Binding var inputDisabled: Bool

  var body: some View {
    VStack(spacing: 32) {
      HStack(spacing: 32) {
        TileButton(color: .red, game: $game, tile: $game.tiles[0], inputDisabled: $inputDisabled)
        TileButton(color: .blue, game: $game, tile: $game.tiles[1], inputDisabled: $inputDisabled)
      }
      HStack(spacing: 32) {
        TileButton(color: .green, game: $game, tile: $game.tiles[2], inputDisabled: $inputDisabled)
        TileButton(color: .purple, game: $game, tile: $game.tiles[3], inputDisabled: $inputDisabled)
      }
    }
  }
}

struct TileButton: View {
  var color: Color
  @Binding var game: GameData
  @Binding var tile: TileData
  @Binding var inputDisabled: Bool

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
    }.disabled(inputDisabled)
  }

  func timerReset(_ delay: Double) {
    Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
      self.game.resetGuess()
    }
  }

  func playTarget(_ delayStart: Double) {
    var delay = delayStart
    inputDisabled = true
    for tileIndex in 0..<game.targetSequence.count {
      let tileIndexCopy = tileIndex
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
        if tileIndexCopy == game.targetSequence.count-1 {
          inputDisabled = false
        }
      }
      delay += 0.2
    }
  }
}

struct Board_Previews: PreviewProvider {
  @State static var game = GameData(["cat", "dog", "horse", "cow"])
  @State static var inputDisabled = false

  static var previews: some View {
    Board(game: $game, inputDisabled: $inputDisabled)
  }
}
