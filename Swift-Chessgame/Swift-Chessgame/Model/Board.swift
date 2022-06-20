//
//  Board.swift
//  Swift-Chessgame
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import Foundation

class Board {
    
    private var pieces: [[PieceType?]]
    
    init() {
        var pieces = [[PieceType?]]()
        
        for rank in 1...8 {
            let team: Team = (rank == 1 || rank == 2) ? .white : .black
            
            let isPawnRank = rank == 2 || rank == 7
            if isPawnRank {
                let pawnRank = "ABCDEFGH".map { file in
                    return Pawn(team: team, position: .init(rank: rank, file: "\(file)"))
                }
                pieces.append(pawnRank)
                continue
            }
            
            let isFirstRankOfEachTeam = rank == 1 || rank == 8
            if isFirstRankOfEachTeam {
                pieces.append([
                    Luke(team: team, position: Position(rank: rank, file: "A")),
                    Knight(team: team, position: Position(rank: rank, file: "B")),
                    Bishop(team: team, position: Position(rank: rank, file: "C")),
                    nil,
                    Queen(team: team, position: Position(rank: rank, file: "E")),
                    Bishop(team: team, position: Position(rank: rank, file: "F")),
                    Knight(team: team, position: Position(rank: rank, file: "G")),
                    Luke(team: team, position: Position(rank: rank, file: "H"))
                ])
                continue
            }
            
            let emptyPiecesRank = [PieceType?](repeating: nil, count: 8)
            pieces.append(emptyPiecesRank)
        }
        self.pieces = pieces
    }
    
    func findPiece(at position: Position) -> PieceType? {
        if position.rankIndex < self.pieces.count, let fileIndex = position.fileIndex {
            return self.pieces[position.rankIndex][fileIndex]
        }
        return nil
    }
}
