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
    
    func movableRoute() -> [PieceRoute]
}

enum Team {
    
    case black
    case white
}

struct PiecePresentation {
    var displayString: String
}

struct PieceRoute: Equatable {
    
    enum Direction {
        case up, down, left, right, upperLeftDiagonal, upperRightDiagonal, bottomLeftDiagonal, bottomRightDiagonal
    }
    
    private(set) var step = [ChessPosition]()
    
    private var piecePosition: ChessPosition
    
    private var origin: ChessPosition {
        return self.step.last ?? self.piecePosition
    }
    
    init(position: ChessPosition, route: [ChessPosition] = []) {
        self.piecePosition = position
        self.step = route
    }
    
    func moveTo(_ direction: Direction) -> PieceRoute? {
        let movableStep: ChessPosition?
        switch direction {
        case .up:
            movableStep = self.origin.up()
        case .down:
            movableStep = self.origin.down()
        case .left:
            movableStep = self.origin.left()
        case .right:
            movableStep = self.origin.right()
        case .upperLeftDiagonal:
            movableStep = self.origin.upperLeftDiagonal()
        case .upperRightDiagonal:
            movableStep = self.origin.upperRightDiagonal()
        case .bottomLeftDiagonal:
            movableStep = self.origin.bottomLeftDiagonal()
        case .bottomRightDiagonal:
            movableStep = self.origin.bottomRightDiagonal()
        }
        
        if let movableStep = movableStep {
            return .init(position: self.piecePosition, route: self.step + [movableStep])
        } else {
            return nil
        }
    }
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
    
    func movableRoute() -> [PieceRoute] {
        let route = PieceRoute(position: self.position)
        if team == .black {
            return [
                route.moveTo(.left),
                route.moveTo(.down),
                route.moveTo(.right)
            ].compactMap { $0 }
        } else {
            return [
                route.moveTo(.up),
                route.moveTo(.left),
                route.moveTo(.right)
            ].compactMap { $0 }
        }
        
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
    
    func movableRoute() -> [PieceRoute] {
        let route = PieceRoute(position: self.position)
        return [
            route.moveTo(.up)?.moveTo(.upperLeftDiagonal),
            route.moveTo(.up)?.moveTo(.upperRightDiagonal),
            route.moveTo(.down)?.moveTo(.bottomLeftDiagonal),
            route.moveTo(.down)?.moveTo(.bottomRightDiagonal)
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
    
    func movableRoute() -> [PieceRoute] {
        let route = PieceRoute(position: self.position)
        return [
            route.moveTo(.upperLeftDiagonal),
            route.moveTo(.upperRightDiagonal),
            route.moveTo(.bottomLeftDiagonal),
            route.moveTo(.bottomRightDiagonal)
        ].compactMap { $0 }
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
    
    func movableRoute() -> [PieceRoute] {
        let route = PieceRoute(position: self.position)
        return [
            route.moveTo(.up),
            route.moveTo(.left),
            route.moveTo(.down),
            route.moveTo(.right)
        ].compactMap { $0 }
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
    
    func movableRoute() -> [PieceRoute] {
        let route = PieceRoute(position: self.position)
        return [
            route.moveTo(.up),
            route.moveTo(.upperLeftDiagonal),
            route.moveTo(.left),
            route.moveTo(.bottomLeftDiagonal),
            route.moveTo(.down),
            route.moveTo(.bottomRightDiagonal),
            route.moveTo(.right),
            route.moveTo(.upperRightDiagonal),
        ].compactMap { $0 }
    }
    
    var displayModel: PiecePresentation {
        return PiecePresentation(
            displayString: self.team == .white ? "\u{2655}" : "\u{265B}"
        )
    }
}
