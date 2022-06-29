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
    
    func test_black_pawn_movableRoute() {
        // given
        let pawn = Pawn(team: .black, position: .init(row: .two, column: .b))
        
        // then
        XCTAssertEqual(pawn.movableRoute().map { $0.step }, [
            [ChessPosition(row: .two, column: .a)],
            [ChessPosition(row: .three, column: .b)],
            [ChessPosition(row: .two, column: .c)]
        ])
    }
    
    func test_white_pawn_movableRoute() {
        // given
        let pawn = Pawn(team: .white, position: .init(row: .seven, column: .b))
        
        // then
        XCTAssertEqual(pawn.movableRoute().map { $0.step }, [
            [ChessPosition(row: .six, column: .b)],
            [ChessPosition(row: .seven, column: .a)],
            [ChessPosition(row: .seven, column: .c)]
        ])
    }
    
    func test_knight_test_white_pawn_movableRoute() {
        // given
        let blackKnight = Knight(team: .black, position: .init(row: .one, column: .b))
        let whiteKnight = Knight(team: .white, position: .init(row: .eight, column: .b))
        
        // then
        XCTAssertEqual(blackKnight.movableRoute().map { $0.step }, [
            [
                ChessPosition(row: .two, column: .b),
                ChessPosition(row: .three, column: .a)
            ],
            [
                ChessPosition(row: .two, column: .b),
                ChessPosition(row: .three, column: .c)
            ]
        ])
        
        XCTAssertEqual(whiteKnight.movableRoute().map { $0.step }, [
            [
                ChessPosition(row: .seven, column: .b),
                ChessPosition(row: .six, column: .a)
            ],
            [
                ChessPosition(row: .seven, column: .b),
                ChessPosition(row: .six, column: .c)
            ]
        ])
    }
    
    func test_rook_movableRoute() {
        // given
        let blackRook = Rook(team: .black, position: .init(row: .one, column: .a))
        let whiteRook = Rook(team: .white, position: .init(row: .eight, column: .h))
        
        // then
        XCTAssertEqual(blackRook.movableRoute().map { $0.step }, [
            [ChessPosition(row: .two, column: .a)],
            [ChessPosition(row: .one, column: .b)]
        ])
        
        XCTAssertEqual(whiteRook.movableRoute().map { $0.step }, [
            [ChessPosition(row: .seven, column: .h)],
            [ChessPosition(row: .eight, column: .g)]
        ])
    }
    
    func test_bishop_movableRoute() {
        // given
        let blackBishop = Bishop(team: .black, position: .init(row: .one, column: .c))
        let whiteBishop = Bishop(team: .white, position: .init(row: .eight, column: .f))
        
        // then
        XCTAssertEqual(blackBishop.movableRoute().map { $0.step }, [
            [ChessPosition(row: .two, column: .b)],
            [ChessPosition(row: .two, column: .d)]
        ])
        
        XCTAssertEqual(whiteBishop.movableRoute().map { $0.step }, [
            [ChessPosition(row: .seven, column: .e)],
            [ChessPosition(row: .seven, column: .g)]
        ])
    }
    
    func test_Queen_movableRoute() {
        // given
        let blackQueen = Queen(team: .black, position: .init(row: .one, column: .e))
        let whiteQueen = Queen(team: .white, position: .init(row: .eight, column: .e))
        
        // then
        XCTAssertEqual(blackQueen.movableRoute().map { $0.step }, [
            [ChessPosition(row: .one, column: .d)],
            [ChessPosition(row: .two, column: .d)],
            [ChessPosition(row: .two, column: .e)],
            [ChessPosition(row: .two, column: .f)],
            [ChessPosition(row: .one, column: .f)]
        ])
        
        XCTAssertEqual(whiteQueen.movableRoute().map { $0.step }, [
            [ChessPosition(row: .seven, column: .e)],
            [ChessPosition(row: .seven, column: .d)],
            [ChessPosition(row: .eight, column: .d)],
            [ChessPosition(row: .eight, column: .f)],
            [ChessPosition(row: .seven, column: .f)]
        ])
    }
}
