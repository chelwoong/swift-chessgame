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
    var position: Position { get set }
}

struct Position {
    
    var rank: Int
    var file: String
    
    var rankIndex: Int {
        return rank - 1
    }
    
    var fileIndex: Int? {
        let validFiles = Array("ABCDEFGH")
        if let index = validFiles.firstIndex(where: { "\($0)" == file }) {
            return validFiles.distance(from: validFiles.startIndex, to: index)
        }
        return nil
    }
}

enum Team {
    
    case black
    case white
}

struct Pawn: PieceType {
    
    let team: Team
    let score = 1
    var position: Position
}

struct Knight: PieceType {
    
    let team: Team
    let score = 3
    var position: Position
}

struct Bishop: PieceType {
    
    let team: Team
    let score = 3
    var position: Position
}

struct Luke: PieceType {
    
    let team: Team
    let score = 5
    var position: Position
}

struct Queen: PieceType {
    
    let team: Team
    let score = 9
    var position: Position
}
