//
//  PieceTests.swift
//  Swift-Chessgame
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import XCTest
@testable import Swift_Chessgame

class PieceTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_white_pawn_movablePosition() {
        // given
        let pawn = Pawn(team: .white, position: .init(row: .two, column: .b))
        
        // when
        let movablePositions = pawn.movablePositions()
        
        // then
        XCTAssertEqual(movablePositions, [
            ChessPosition(row: .three, column: .b),
            ChessPosition(row: .two, column: .a),
            ChessPosition(row: .two, column: .c)
        ])
    }
    
    func test_black_pawn_movablePosition() {
        // given
        let pawn = Pawn(team: .black, position: .init(row: .seven, column: .b))
        
        // when
        let movablePositions = pawn.movablePositions()
        
        // then
        XCTAssertEqual(movablePositions, [
            ChessPosition(row: .six, column: .b),
            ChessPosition(row: .seven, column: .a),
            ChessPosition(row: .seven, column: .c)
        ])
    }
}
