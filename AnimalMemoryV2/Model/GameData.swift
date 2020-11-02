//
//  GameData.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-01.
//

import Foundation

enum GuessState {
  case success
  case failed
  case notDone
}

struct GameData {
  var tiles: [TileData] = []
  var targetSequence: [String] = []
  var guessSequence: [String] = []
  var maxScore = 0

  init(_ name: [String]) {
    let randomizedName = name.shuffled()
    self.tiles = (0..<name.count).map { TileData(randomizedName[$0]) }
  }

  mutating func reset() {
    guessSequence = []
    targetSequence = []
    incrementTarget()
  }

  mutating func incrementTarget() {
    let tileNames = (0..<tiles.count).map { tiles[$0].name }
    targetSequence.append(tileNames.randomElement()!)

    print("Target: \(targetSequence)")
  }

  @discardableResult mutating func pressTile(_ tile: String) -> GuessState {
    guessSequence.append(tile)

    print("Guess: \(guessSequence)")
    if guessSequence.count < targetSequence.count {
      return GuessState.notDone
    }
    if guessSequence.elementsEqual(targetSequence) {
      return GuessState.success
    } else {
      return GuessState.failed
    }
  }

  func tileFor(_ name: String) -> TileData {
    tiles.filter { tile in
      tile.name == name
    }[0]
  }
}
