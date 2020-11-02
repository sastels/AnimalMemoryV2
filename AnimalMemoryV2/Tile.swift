//
//  Tile.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Tile: View {
  var data: TileData

  init(_ tileData: TileData) {
    data = tileData
  }

  var body: some View {
    VStack {
      Text(data.name)
      if data.state == .up {
        Text("Up")
      } else {
        Text("Down")
      }
    }
  }
}

struct Tile_Previews: PreviewProvider {
  static var previews: some View {
    Tile(TileData("cat"))
  }
}
