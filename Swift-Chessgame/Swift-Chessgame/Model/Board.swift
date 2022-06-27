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
                    return Pawn(team: team, position: ChessPosition(row: file, column: rank))
                }
                pieces.append(pawnRow)
                continue
            }
            
            let isFirstRankOfEachTeam = file == .one || file == .eight
            if isFirstRankOfEachTeam {
                pieces.append([
                    Rook(team: team, position: ChessPosition(row: file, column: .a)),
                    Knight(team: team, position: ChessPosition(row: file, column: .b)),
                    Bishop(team: team, position: ChessPosition(row: file, column: .c)),
                    nil,
                    Queen(team: team, position: ChessPosition(row: file, column: .e)),
                    Bishop(team: team, position: ChessPosition(row: file, column: .f)),
                    Knight(team: team, position: ChessPosition(row: file, column: .g)),
                    Rook(team: team, position: ChessPosition(row: file, column: .h))
                ])
                continue
            }
            
            let emptyPiecesRank = [PieceType?](repeating: nil, count: 8)
            pieces.append(emptyPiecesRank)
        }
        self.pieces = pieces
    }
    
    func findPiece(at position: ChessPosition) -> PieceType? {
        return self.pieces[position.row.rawValue][position.column.rawValue]
    }
    
    func movePiece(from curr: ChessPosition, to dest: ChessPosition) -> Bool {
        return false
    }

    func display() -> String {
        return self.pieces.map { row in
            return row.reduce("", { $0 + ($1?.displayModel.displayString ?? ".") })
        }.joined(separator: "\n")
    }
}
