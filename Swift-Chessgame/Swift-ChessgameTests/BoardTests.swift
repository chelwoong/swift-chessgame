//
//  BoardTests.swift
//  Swift-Chessgame
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import XCTest
@testable import Swift_Chessgame

class BoardTests: XCTestCase {
    
    var sut: Board!
    
    override func setUpWithError() throws {
        self.sut = Board()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_empty_pieces_when_init_board() {
        let emptyRanks = [3, 4, 5, 6]
        let files = "ABCDEFGH"
        for rank in emptyRanks {
            for file in files {
                let piece = self.sut.findPiece(at: Position(rank: rank, file: String(file)))
                XCTAssertNil(piece)
            }
        }
    }
    
    func test_pawn_when_init_board() {
        let pawnRanks = [2, 7]
        let files = "ABCDEFGH"
        for rank in pawnRanks {
            for file in files {
                let piece = self.sut.findPiece(at: Position(rank: rank, file: String(file)))
                XCTAssertNotNil(piece as? Pawn)
            }
        }
    }
}
