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
        let pawn = Pawn(team: .black)
        
        // then
        XCTAssertEqual(pawn.movableRoute(at: .init(row: .two, column: .b)).map { $0.step }, [
            [ChessPosition(row: .two, column: .a)],
            [ChessPosition(row: .three, column: .b)],
            [ChessPosition(row: .two, column: .c)]
        ])
    }
    
    func test_white_pawn_movableRoute() {
        // given
        let pawn = Pawn(team: .white)
        
        // then
        XCTAssertEqual(pawn.movableRoute(at: .init(row: .seven, column: .b)).map { $0.step }, [
            [ChessPosition(row: .six, column: .b)],
            [ChessPosition(row: .seven, column: .a)],
            [ChessPosition(row: .seven, column: .c)]
        ])
    }
    
    func test_knight_test_white_pawn_movableRoute() {
        // given
        let blackKnight = Knight(team: .black)
        let whiteKnight = Knight(team: .white)
        
        // then
        XCTAssertEqual(blackKnight.movableRoute(at: .init(row: .one, column: .b)).map { $0.step }, [
            [
                ChessPosition(row: .two, column: .b),
                ChessPosition(row: .three, column: .a)
            ],
            [
                ChessPosition(row: .two, column: .b),
                ChessPosition(row: .three, column: .c)
            ]
        ])
        
        XCTAssertEqual(whiteKnight.movableRoute(at: .init(row: .eight, column: .b)).map { $0.step }, [
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
        let blackRook = Rook(team: .black)
        let whiteRook = Rook(team: .white)
        
        // then
        XCTAssertEqual(blackRook.movableRoute(at: .init(row: .one, column: .a)).map { $0.step }, [
            [ChessPosition(row: .two, column: .a)],
            [ChessPosition(row: .one, column: .b)]
        ])
        
        XCTAssertEqual(whiteRook.movableRoute(at: .init(row: .eight, column: .h)).map { $0.step }, [
            [ChessPosition(row: .seven, column: .h)],
            [ChessPosition(row: .eight, column: .g)]
        ])
    }
    
    func test_bishop_movableRoute() {
        // given
        let blackBishop = Bishop(team: .black)
        let whiteBishop = Bishop(team: .white)
        
        // then
        XCTAssertEqual(blackBishop.movableRoute(at: .init(row: .one, column: .c)).map { $0.step }, [
            [ChessPosition(row: .two, column: .b)],
            [ChessPosition(row: .two, column: .d)]
        ])
        
        XCTAssertEqual(whiteBishop.movableRoute(at: .init(row: .eight, column: .f)).map { $0.step }, [
            [ChessPosition(row: .seven, column: .e)],
            [ChessPosition(row: .seven, column: .g)]
        ])
    }
    
    func test_Queen_movableRoute() {
        // given
        let blackQueen = Queen(team: .black)
        let whiteQueen = Queen(team: .white)
        
        // then
        XCTAssertEqual(blackQueen.movableRoute(at: .init(row: .one, column: .e)).map { $0.step }, [
            [ChessPosition(row: .one, column: .d)],
            [ChessPosition(row: .two, column: .d)],
            [ChessPosition(row: .two, column: .e)],
            [ChessPosition(row: .two, column: .f)],
            [ChessPosition(row: .one, column: .f)]
        ])
        
        XCTAssertEqual(whiteQueen.movableRoute(at: .init(row: .eight, column: .e)).map { $0.step }, [
            [ChessPosition(row: .seven, column: .e)],
            [ChessPosition(row: .seven, column: .d)],
            [ChessPosition(row: .eight, column: .d)],
            [ChessPosition(row: .eight, column: .f)],
            [ChessPosition(row: .seven, column: .f)]
        ])
    }
}
