//
//  Tile.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import SwiftUI

struct Tile: View {
  var data: TileData
  var color: Color

  init(_ tileData: TileData, color: Color) {
    data = tileData
    self.color = color
  }

  var body: some View {
    let backgroundColor: Color = data.state == TileState.up ? color.opacity(0.9) : color.opacity(0.3)

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
    Tile(TileData("cat"), color: Color.red)
  }
}
