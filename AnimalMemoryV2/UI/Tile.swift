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
    let backgroundColor: Color = data.state == TileState.up ? .white : Color.blue.opacity(0.5)

    return
      Text(data.name)
        .font(.system(size: 60))
        .foregroundColor(.black)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .center)
        .aspectRatio(1, contentMode: .fit)
        .background(RoundedRectangle(cornerRadius: 25).fill(backgroundColor).shadow(radius: 3))
  }
}

struct Tile_Previews: PreviewProvider {
  static var previews: some View {
    Tile(TileData("cat"))
  }
}
