//
//  GameDataTests.swift
//  AnimalMemoryV2Tests
//
//  Created by Stephen Astels on 2020-11-01.
//

import XCTest

class GameDataTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testInit() throws {
    let expectedNames = ["a", "b", "c", "d"]
    let game = GameData(expectedNames)
    let actualNames = ((0..<4).map { game.tiles[$0].name }).sorted()
    
    XCTAssertEqual(game.maxScore, 0)
    XCTAssertEqual(game.targetSequence.count, 0)
    XCTAssertEqual(game.tiles.count, expectedNames.count)
    XCTAssertEqual(actualNames, expectedNames)
    XCTAssertEqual(game.gameState, GameState.notDone)
  }
  
  func testTileFor() throws {
    let game = GameData(["a", "b", "c", "d"])
    XCTAssertEqual(game.tileFor("c").name, "c")
  }
  
  func testIncrementTarget() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    XCTAssertEqual(game.targetSequence.count, 1)
    game.incrementTarget()
    XCTAssertEqual(game.targetSequence.count, 2)
  }
  
  func testPressTileLen1a() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    
    game.pressTile(game.targetSequence[0])
    XCTAssertEqual(game.gameState, GameState.success)
  }
  
  func testPressTileLen1b() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    
    game.pressTile("bad tile")
    XCTAssertEqual(game.gameState, GameState.failed)
  }
  
  func testPressTileLen2a() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    game.incrementTarget()
    
    game.pressTile(game.targetSequence[0])
    XCTAssertEqual(game.gameState, GameState.notDone)
    game.pressTile(game.targetSequence[1])
    XCTAssertEqual(game.gameState, GameState.success)
  }
  
  func testPressTileLen2b() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    game.incrementTarget()
    
    game.pressTile("guess1")
    XCTAssertEqual(game.gameState, GameState.notDone)
    game.pressTile("guess2")
    XCTAssertEqual(game.gameState, GameState.failed)
  }
  
  func testReset() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    game.incrementTarget()
    game.incrementTarget()
    game.pressTile("tile")
    game.reset()
    XCTAssertEqual(game.gameState, GameState.notDone)
    XCTAssertEqual(game.targetSequence.count, 0)
    XCTAssertEqual(game.guessSequence.count, 0)
  }
  
  func testResetGuess() throws {
    var game = GameData(["a", "b", "c", "d"])
    game.incrementTarget()
    game.incrementTarget()
    game.pressTile("tile")
    game.resetGuess()
    XCTAssertEqual(game.gameState, GameState.notDone)
    XCTAssertEqual(game.guessSequence.count, 0)
    XCTAssertEqual(game.targetSequence.count, 2)
  }
}
