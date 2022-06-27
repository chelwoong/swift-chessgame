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
    var displayModel: PiecePresentation { get }
    
    func movablePositions() -> [ChessPosition]
}

enum Team {
    
    case black
    case white
}

struct PiecePresentation {
    var displayString: String
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
    
    func upperLeftDiagonal() -> ChessPosition? {
        return self.up()?.left()
    }
    
    func upperRightDiagonal() -> ChessPosition? {
        return self.up()?.right()
    }
    
    func bottomLeftDiagonal() -> ChessPosition? {
        return self.down()?.left()
    }
    
    func bottomRightDiagonal() -> ChessPosition? {
        return self.down()?.right()
    }
}

struct Pawn: PieceType {
    
    let team: Team
    let score = 1
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return [
            team == .white ? self.position.down() : self.position.up(),
            self.position.left(),
            self.position.right()
        ].compactMap { $0 }
    }
    
    var displayModel: PiecePresentation {
        return PiecePresentation(
            displayString: self.team == .white ? "\u{2659}" : "\u{265F}"
        )
    }
}

struct Knight: PieceType {
    
    let team: Team
    let score = 3
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        return [
            self.position.up()?.upperRightDiagonal(),
            self.position.up()?.upperLeftDiagonal(),
            self.position.down()?.bottomLeftDiagonal(),
            self.position.down()?.bottomRightDiagonal(),
        ].compactMap { $0 }
    }
    
    var displayModel: PiecePresentation {
        return PiecePresentation(
            displayString: self.team == .white ? "\u{2658}" : "\u{265E}"
        )
    }
}

struct Bishop: PieceType {
    
    let team: Team
    let score = 3
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        var movablePositions = [ChessPosition]()
        
        var current = self.position
        while let next = current.upperRightDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.upperLeftDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.bottomRightDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.bottomLeftDiagonal() {
            movablePositions.append(next)
        }
        
        return movablePositions
    }
    
    var displayModel: PiecePresentation {
        return PiecePresentation(
            displayString: self.team == .white ? "\u{2657}" : "\u{265D}"
        )
    }
}

struct Rook: PieceType {
    
    let team: Team
    let score = 5
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        var movablePositions = [ChessPosition]()
        
        var current = self.position
        while let next = current.up() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.down() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.left() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.right() {
            movablePositions.append(next)
        }
        
        return movablePositions
    }
    
    var displayModel: PiecePresentation {
        return PiecePresentation(
            displayString: self.team == .white ? "\u{2656}" : "\u{265C}"
        )
    }
}

struct Queen: PieceType {
    
    let team: Team
    let score = 9
    var position: ChessPosition
    
    func movablePositions() -> [ChessPosition] {
        var movablePositions = [ChessPosition]()
        
        var current = self.position
        while let next = current.upperRightDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.upperLeftDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.bottomRightDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.bottomLeftDiagonal() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.up() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.down() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.left() {
            movablePositions.append(next)
        }
        
        current = self.position
        while let next = current.right() {
            movablePositions.append(next)
        }
        
        return movablePositions
    }
    
    var displayModel: PiecePresentation {
        return PiecePresentation(
            displayString: self.team == .white ? "\u{2655}" : "\u{265B}"
        )
    }
}
