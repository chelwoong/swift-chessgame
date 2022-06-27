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
        
    }
    
    func test_empty_pieces_when_init_board() {
        // given
        let emptyFiles: [ChessPosition.File] = [.three, .four, .five, .six]
        
        // then
        for file in emptyFiles {
            ChessPosition.Rank.allCases.forEach { rank in
                let piece = self.sut.findPiece(at: ChessPosition(row: file, column: rank))
                XCTAssertNil(piece)
            }
        }
    }
    
    func test_pawn_when_init_board() {
        // given
        let pawnFiles: [ChessPosition.File] = [.two, .seven]
        
        // then
        for file in pawnFiles {
            ChessPosition.Rank.allCases.forEach { rank in
                let piece = self.sut.findPiece(at: ChessPosition(row: file, column: rank))
                XCTAssertNotNil(piece as? Pawn)
            }
        }
    }
    
    func test_rook_when_init_board() {
        // given
        let whiteRooks = [
            self.sut.findPiece(at: ChessPosition(row: .one, column: .a)),
            self.sut.findPiece(at: ChessPosition(row: .one, column: .h)),
        ]
        let blackRooks = [
            self.sut.findPiece(at: ChessPosition(row: .eight, column: .a)),
            self.sut.findPiece(at: ChessPosition(row: .eight, column: .h))
        ]
        
        // then
        whiteRooks.forEach { piece in
            let rook = piece as? Rook
            XCTAssertNotNil(rook)
            XCTAssertEqual(rook?.team, .white)
        }
        
        blackRooks.forEach { piece in
            let rook = piece as? Rook
            XCTAssertNotNil(rook)
            XCTAssertEqual(rook?.team, .black)
        }
    }
    
    func test_knight_when_init_board() {
        // given
        let whiteKnights = [
            self.sut.findPiece(at: ChessPosition(row: .one, column: .b)),
            self.sut.findPiece(at: ChessPosition(row: .one, column: .g)),
        ]
        let blackKnights = [
            self.sut.findPiece(at: ChessPosition(row: .eight, column: .b)),
            self.sut.findPiece(at: ChessPosition(row: .eight, column: .g)),
        ]
        
        // then
        whiteKnights.forEach { piece in
            let knight = piece as? Knight
            XCTAssertNotNil(knight)
            XCTAssertEqual(knight?.team, .white)
        }
        
        blackKnights.forEach { piece in
            let knight = piece as? Knight
            XCTAssertNotNil(knight)
            XCTAssertEqual(knight?.team, .black)
        }
    }
    
    func test_bishop_when_init_board() {
        // given
        let whiteBishops = [
            self.sut.findPiece(at: ChessPosition(row: .one, column: .c)),
            self.sut.findPiece(at: ChessPosition(row: .one, column: .f)),
        ]
        let blackBishops = [
            self.sut.findPiece(at: ChessPosition(row: .eight, column: .c)),
            self.sut.findPiece(at: ChessPosition(row: .eight, column: .f))
        ]
        
        // then
        whiteBishops.forEach { piece in
            let bishop = piece as? Bishop
            XCTAssertNotNil(bishop)
            XCTAssertEqual(bishop?.team, .white)
        }
        
        blackBishops.forEach { piece in
            let bishop = piece as? Bishop
            XCTAssertNotNil(bishop)
            XCTAssertEqual(bishop?.team, .black)
        }
    }
    
    func test_queen_when_init_board() {
        // given
        let whiteQueen = self.sut.findPiece(at: ChessPosition(row: .one, column: .e))
        let blackQueen = self.sut.findPiece(at: ChessPosition(row: .eight, column: .e))
        
        // then
        XCTAssertNotNil(whiteQueen as? Queen)
        XCTAssertEqual(whiteQueen?.team, .white)
        
        XCTAssertNotNil(blackQueen as? Queen)
        XCTAssertEqual(blackQueen?.team, .black)
    }
}
