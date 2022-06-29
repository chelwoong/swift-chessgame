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
    
    func movablePositions(at position: ChessPosition) -> [ChessPosition] {
        // TODO: 
        return []
    }
    
    private func isMovableRoute(_ route: PieceRoute) -> Bool {
        return route.step
            .filter({ self.pieces[$0] != nil })
            .isEmpty
    }
    
    func movePiece(from curr: ChessPosition, to dest: ChessPosition) -> Bool {
        // TODO:
        return false
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
