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
            [
                ChessPosition(row: .two, column: .a),
                ChessPosition(row: .three, column: .a),
                ChessPosition(row: .four, column: .a),
                ChessPosition(row: .five, column: .a),
                ChessPosition(row: .six, column: .a),
                ChessPosition(row: .seven, column: .a),
                ChessPosition(row: .eight, column: .a)
            ],
            [
                ChessPosition(row: .one, column: .b),
                ChessPosition(row: .one, column: .c),
                ChessPosition(row: .one, column: .d),
                ChessPosition(row: .one, column: .e),
                ChessPosition(row: .one, column: .f),
                ChessPosition(row: .one, column: .g),
                ChessPosition(row: .one, column: .h)
                
            ]
        ])
        
        XCTAssertEqual(whiteRook.movableRoute(at: .init(row: .eight, column: .h)).map { $0.step }, [
            [
                ChessPosition(row: .seven, column: .h),
                ChessPosition(row: .six, column: .h),
                ChessPosition(row: .five, column: .h),
                ChessPosition(row: .four, column: .h),
                ChessPosition(row: .three, column: .h),
                ChessPosition(row: .two, column: .h),
                ChessPosition(row: .one, column: .h)
            ],
            [
                ChessPosition(row: .eight, column: .g),
                ChessPosition(row: .eight, column: .f),
                ChessPosition(row: .eight, column: .e),
                ChessPosition(row: .eight, column: .d),
                ChessPosition(row: .eight, column: .c),
                ChessPosition(row: .eight, column: .b),
                ChessPosition(row: .eight, column: .a),
            ]
        ])
    }
    
    func test_bishop_movableRoute() {
        // given
        let blackBishop = Bishop(team: .black)
        let whiteBishop = Bishop(team: .white)
        
        // then
        XCTAssertEqual(blackBishop.movableRoute(at: .init(row: .one, column: .c)).map { $0.step }, [
            [
                ChessPosition(row: .two, column: .b),
                ChessPosition(row: .three, column: .a)
            ],
            [
                ChessPosition(row: .two, column: .d),
                ChessPosition(row: .three, column: .e),
                ChessPosition(row: .four, column: .f),
                ChessPosition(row: .five, column: .g),
                ChessPosition(row: .six, column: .h)
            ]
        ])
        
        XCTAssertEqual(whiteBishop.movableRoute(at: .init(row: .eight, column: .f)).map { $0.step }, [
            [
                ChessPosition(row: .seven, column: .e),
                ChessPosition(row: .six, column: .d),
                ChessPosition(row: .five, column: .c),
                ChessPosition(row: .four, column: .b),
                ChessPosition(row: .three, column: .a)
            ],
            [
                ChessPosition(row: .seven, column: .g),
                ChessPosition(row: .six, column: .h),
            ]
        ])
    }
    
    func test_Queen_movableRoute() {
        // given
        let blackQueen = Queen(team: .black)
        let whiteQueen = Queen(team: .white)
        
        // then
        let blackRow = 0
        let blackCol = 4
        XCTAssertEqual(blackQueen.movableRoute(at: .init(row: .one, column: .e)).map { $0.step }, [
            (0..<blackCol).reversed().map { col in
                ChessPosition(row: .one, column: .init(rawValue: col)!)
            },
            zip((blackRow+1..<8), (0..<blackCol).reversed()).map { (row, col) in
                ChessPosition(row: .init(rawValue: row)!, column: .init(rawValue: col)!)
            },
            (blackRow+1..<8).map { row in
                ChessPosition(row: .init(rawValue: row)!, column: .e)
            },
            zip((blackRow+1..<8), (blackCol+1..<8)).map { (row, col) in
                ChessPosition(row: .init(rawValue: row)!, column: .init(rawValue: col)!)
            },
            (blackCol+1..<8).map { col in
                ChessPosition(row: .one, column: .init(rawValue: col)!)
            }
        ])
    }
}
