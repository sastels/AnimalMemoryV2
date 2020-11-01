//
//  TileTests.swift
//  AnimalMemoryV2Tests
//
//  Created by Stephen Astels on 2020-11-01.
//

import XCTest

class TileTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testInit() {
    let tile = Tile("test name")
    XCTAssertEqual(tile.name, "test name")
    XCTAssertEqual(tile.state, TileState.up)
  }
}
