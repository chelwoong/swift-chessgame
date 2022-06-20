//
//  Board.swift
//  Swift-Chessgame
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import Foundation

protocol PieceType {
    
    var position: Position { get }
    var team: Team { get }
}

struct Position {
    
    var rank: Int
    var file: String
}

enum Team {
    
    case black
    case white
}

struct Pawn: PieceType {
    
    var position: Position
    let team: Team
}

struct Knight: PieceType {
    
    var position: Position
    let team: Team
}

struct Bishop: PieceType {
    
    var position: Position
    let team: Team
}

struct Luke: PieceType {
    
    var position: Position
    let team: Team
}

struct Queen: PieceType {
    
    var position: Position
    let team: Team
}

class Board {
    
}
