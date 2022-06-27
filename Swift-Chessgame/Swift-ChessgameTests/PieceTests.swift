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
    
    func test_pawn_movablePosition_at_leftTopEdge() {
        // given
        let pawn = Pawn(team: .white, position: .init(row: .one, column: .a))
        let rightPosition = ChessPosition(row: .one, column: .b)
        let downPosition = ChessPosition(row: .two, column: .a)
        
        // when
        let movablePositions = pawn.movablePositions()
        
        // then
        XCTAssertTrue(movablePositions.contains(rightPosition))
        XCTAssertTrue(movablePositions.contains(downPosition))
    }
    
    func test_pawn_movablePosition_at_rightDownEdge() {
        // given
        let pawn = Pawn(team: .white, position: .init(row: .eight, column: .h))
        let leftPosition = ChessPosition(row: .seven, column: .h)
        let upPosition = ChessPosition(row: .eight, column: .g)
        
        // when
        let movablePositions = pawn.movablePositions()
        
        // then
        XCTAssertTrue(movablePositions.contains(leftPosition))
        XCTAssertTrue(movablePositions.contains(upPosition))
    }
    
    func test_pawn_movablePosition_at_inside() {
        // given
        let pawn = Pawn(team: .white, position: .init(row: .two, column: .b))
        
        let upPosition = ChessPosition(row: .one, column: .b)
        let downPosition = ChessPosition(row: .three, column: .b)
        let leftPosition = ChessPosition(row: .two, column: .a)
        let rightPosition = ChessPosition(row: .two, column: .c)
        
        
        // when
        let movablePositions = pawn.movablePositions()
        
        // then
        XCTAssertTrue(movablePositions.contains(upPosition))
        XCTAssertTrue(movablePositions.contains(downPosition))
        XCTAssertTrue(movablePositions.contains(leftPosition))
        XCTAssertTrue(movablePositions.contains(rightPosition))
    }
}
