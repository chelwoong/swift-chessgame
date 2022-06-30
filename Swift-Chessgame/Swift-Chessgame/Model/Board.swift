//
//  Board.swift
//  Swift-Chessgame
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import Foundation

class Board {
    
    private var pieces: [[PieceType?]]
    
    private(set) var whiteScore = 0
    private(set) var blackScore = 0
    
    init() {
        var pieces = [[PieceType?]]()
        
        for file in ChessPosition.File.allCases {
            let team: Team = (file == .one || file == .two) ? .white : .black
            
            let isPawnRow = file == .two || file == .seven
            if isPawnRow {
                let pawnRow = ChessPosition.Rank.allCases.map { rank in
                    return Pawn(team: team)
                }
                pieces.append(pawnRow)
                continue
            }
            
            let isFirstRankOfEachTeam = file == .one || file == .eight
            if isFirstRankOfEachTeam {
                pieces.append([
                    Rook(team: team),
                    Knight(team: team),
                    Bishop(team: team),
                    nil,
                    Queen(team: team),
                    Bishop(team: team),
                    Knight(team: team),
                    Rook(team: team)
                ])
                continue
            }
            
            let emptyPiecesRank = [PieceType?](repeating: nil, count: 8)
            pieces.append(emptyPiecesRank)
        }
        self.pieces = pieces
    }
    
    func findPiece(at position: ChessPosition) -> PieceType? {
        return self.pieces[position]
    }
    
    func movablePositions(at position: ChessPosition) -> [ChessPosition] {
        guard let piece = self.pieces[position] else {
            return []
        }
        return piece.movableRoute(at: position)
            .filter { self.isMovableRoute($0, for: piece.team) }
            .flatMap { $0.step }
    }
    
    private func isMovableRoute(_ route: PieceRoute, for team: Team) -> Bool {
        if self.pieces[route.destination]?.team == team {
            return false
        }
        for position in route.step.dropLast() {
            if self.pieces[position] != nil {
                return false
            }
        }
        return true
    }
    
    func movePiece(from curr: ChessPosition, to dest: ChessPosition) -> Bool {
        guard let piece = self.pieces[curr] else {
            return false
        }
        let canMove = piece.movableRoute(at: curr)
            .filter { self.isMovableRoute($0, for: piece.team) }
            .contains(where: { $0.destination == dest })
        
        if canMove {
            self.pieces[curr.row.rawValue][curr.column.rawValue] = nil
            self.pieces[dest.row.rawValue][dest.column.rawValue] = piece
            return true
        } else {
            return false
        }
    }
    
    func display() -> String {
        return self.pieces.map { row in
            return row.reduce("", { $0 + ($1?.displayModel.displayString ?? ".") })
        }.joined(separator: "\n")
    }
}

private extension Array where Element == [PieceType?] {
    
    subscript (_ position: ChessPosition) -> PieceType? {
        if let piece = self[position.row.rawValue][position.column.rawValue] {
            return piece
        } else {
            return nil
        }
    }
}
