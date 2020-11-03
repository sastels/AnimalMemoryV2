//
//  PlayTarget.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import Foundation

func playTarget(_ game: GameData) {
  print("Target")
  for tile in game.targetSequence {
    print("\(tile)")
  }
}
