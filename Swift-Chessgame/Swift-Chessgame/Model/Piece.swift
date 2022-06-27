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

struct ChessPosition {
    
    var row: File
    var column: Rank
    
    enum File: Int, CaseIterable {
        case one = 0, two, three, four, five, six, seven, eight
    }
    
    enum Rank: Int, CaseIterable {
        case a = 0, b, c, d, e, f, g, h
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
        return []
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
