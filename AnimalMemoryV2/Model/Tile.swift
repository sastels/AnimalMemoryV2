//
//  Tile.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-01.
//

import Foundation

enum TileState {
  case down
  case up
}

struct Tile {
  var name = ""
  var state = TileState.up
  
  init(_ name: String) {
    self.name = name
  }
}
