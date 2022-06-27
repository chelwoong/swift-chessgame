//
//  Piece.swift
//  Swift-Chessgame
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import Foundation

protocol PieceType {
    
    var team: Team { get }
    var score: Int { get }
    
    func movablePositions() -> [ChessPosition]
}

struct ChessPosition: Equatable {
    
    var row: File
    var column: Rank
    
    enum File: Int, CaseIterable {
        case one = 0, two, three, four, five, six, seven, eight
    }
    
    enum Rank: Int, CaseIterable {
        case a = 0, b, c, d, e, f, g, h
    }
    
    func up() -> ChessPosition? {
        guard let upRow = File(rawValue: self.row.rawValue - 1) else {
            return nil
        }
        return ChessPosition(row: upRow, column: self.column)
    }
    
    func down() -> ChessPosition? {
        guard let downRow = File(rawValue: self.row.rawValue + 1) else {
            return nil
        }
        return ChessPosition(row: downRow, column: self.column)
    }
    
    func left() -> ChessPosition? {
        guard let leftCol = Rank(rawValue: self.column.rawValue - 1) else {
            return nil
        }
        return ChessPosition(row: self.row, column: leftCol)
    }
    
    func right() -> ChessPosition? {
        guard let rightCol = Rank(rawValue: self.column.rawValue + 1) else {
            return nil
        }
        return ChessPosition(row: self.row, column: rightCol)
    }
}

enum Team {
    
    case black
    case white
}

struct Pawn: PieceType {
    
    let team: Team
    let score = 1
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return [
            self.position.up(),
            self.position.down(),
            self.position.left(),
            self.position.right()
        ].compactMap { $0 }
    }
}

struct Knight: PieceType {
    
    let team: Team
    let score = 3
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return []
    }
}

struct Bishop: PieceType {
    
    let team: Team
    let score = 3
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return []
    }
}

struct Luke: PieceType {
    
    let team: Team
    let score = 5
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return []
    }
}

struct Queen: PieceType {
    
    let team: Team
    let score = 9
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return []
    }
}
