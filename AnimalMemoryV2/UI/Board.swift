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
      if self.game.gameState == .success {
        print("Success!!")
        self.game.incrementTarget()
        timerReset(2.0)
        playTarget(2.0)
      } else if self.game.gameState == .failed {
        print("Failed!!")
        timerReset(2.0)
        playTarget(2.0)
      }
  }) {
      Tile(tile)
    }
  }

  func timerReset(_ delay: Double) {
    Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
      print("reset")
      self.game.resetGuess()
    }
  }

  func playTarget(_ delayStart: Double) {
    print("Target \(game.targetSequence)")
    var delay = delayStart

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

struct Board_Previews: PreviewProvider {
  @State static var game = GameData(["cat", "dog", "horse", "cow"])

  static var previews: some View {
    Board(game: $game)
  }
}
