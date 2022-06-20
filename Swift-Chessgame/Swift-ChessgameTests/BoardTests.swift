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
    
    func test_luke_when_init_board() {
        let whiteLukes = [
            self.sut.findPiece(at: Position(rank: 1, file: "A")),
            self.sut.findPiece(at: Position(rank: 1, file: "H")),
        ]
        let blackLukes = [
            self.sut.findPiece(at: Position(rank: 8, file: "A")),
            self.sut.findPiece(at: Position(rank: 8, file: "H")),
        ]
        
        whiteLukes.forEach { piece in
            let luke = piece as? Luke
            XCTAssertNotNil(luke)
            XCTAssertEqual(luke?.team, .white)
        }
        
        blackLukes.forEach { piece in
            let luke = piece as? Luke
            XCTAssertNotNil(luke)
            XCTAssertEqual(luke?.team, .black)
        }
    }
    
    func test_knight_when_init_board() {
        let whiteKnights = [
            self.sut.findPiece(at: Position(rank: 1, file: "B")),
            self.sut.findPiece(at: Position(rank: 1, file: "G")),
        ]
        let blackKnights = [
            self.sut.findPiece(at: Position(rank: 8, file: "B")),
            self.sut.findPiece(at: Position(rank: 8, file: "G")),
        ]
        
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
        let whiteBishops = [
            self.sut.findPiece(at: Position(rank: 1, file: "C")),
            self.sut.findPiece(at: Position(rank: 1, file: "F")),
        ]
        let blackBishops = [
            self.sut.findPiece(at: Position(rank: 8, file: "C")),
            self.sut.findPiece(at: Position(rank: 8, file: "F")),
        ]
        
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
        let whiteQueen = self.sut.findPiece(at: Position(rank: 1, file: "E"))
        let blackQueen = self.sut.findPiece(at: Position(rank: 8, file: "E"))
        
        XCTAssertNotNil(whiteQueen as? Queen)
        XCTAssertEqual(whiteQueen?.team, .white)
        
        XCTAssertNotNil(blackQueen as? Queen)
        XCTAssertEqual(blackQueen?.team, .black)
    }
}
