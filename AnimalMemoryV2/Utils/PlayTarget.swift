//
//  PlayTarget.swift
//  AnimalMemoryV2
//
//  Created by Stephen Astels on 2020-11-02.
//

import Foundation

//func playTarget(_ game: inout GameData) {
//  print("Target")
//  var delay = 0.0
//
//  
//  for tileIndex in 0..<game.targetSequence.count {
//    let delayCopy = delay
//    let name = game.targetSequence[tileIndex]
//    let previousName = tileIndex > 0 ?game.targetSequence[tileIndex-1] : ""
//    let tile = game.tileFor(name)
//    Timer.scheduledTimer(withTimeInterval: delayCopy, repeats: false) { _ in
//      print("\(tile) \(delayCopy)")
//      if previousName != "" {
//        for i in 0..<game.tiles.count {
//          if game.tiles[i].name == previousName {
//            game.tiles[i].toggleState()
//          }
//        }
//      }
//    }
//    delay += 1.0
//  }
//}
