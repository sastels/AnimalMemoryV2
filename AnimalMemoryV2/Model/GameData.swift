//
//  GameData.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-01.
//

import Foundation

enum GameState {
  case success
  case failed
  case notDone
}

struct GameData {
  var tiles: [TileData] = []
  var targetSequence: [String] = []
  var guessSequence: [String] = []
  var maxScore = 0
  var gameState = GameState.notDone

  init(_ name: [String]) {
    let randomizedName = name.shuffled()
    self.tiles = (0..<name.count).map { TileData(randomizedName[$0]) }
  }

  mutating func reset() {
    guessSequence = []
    targetSequence = []
    gameState = .notDone
  }

  mutating func resetGuess() {
    guessSequence = []
    gameState = .notDone
  }

  mutating func incrementTarget() {
    let tileNames = (0..<tiles.count).map { tiles[$0].name }
    targetSequence.append(tileNames.randomElement()!)
  }

  mutating func pressTile(_ tile: String) {
    guessSequence.append(tile)

    print("Guess: \(guessSequence)")
    if guessSequence.count < targetSequence.count {
      gameState = .notDone
    } else if guessSequence.elementsEqual(targetSequence) {
      gameState = .success
      if targetSequence.count > maxScore {
        maxScore = targetSequence.count
      }
    } else {
      gameState = .failed
    }
  }

  func tileFor(_ name: String) -> TileData {
    tiles.filter { tile in
      tile.name == name
    }[0]
  }
}
