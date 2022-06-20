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
    
    var rankIndex: Int {
        return rank-1
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
    
    private var pieces: [[PieceType?]]
    
    init() {
        var pieces = [[PieceType?]]()
        for rank in 1...8 {
            guard [1, 2, 7, 8].contains(rank) else {
                let emptyRank = [PieceType?](repeating: nil, count: 8)
                pieces.append(emptyRank)
                continue
            }

            let team: Team = (rank == 1 || rank == 2) ? .white : .black

            if rank == 2 || rank == 7 {
                let pawnRank = "ABCDEFGH".map { file in
                    return Pawn(position: .init(rank: rank, file: "\(file)"), team: team)
                }
                pieces.append(pawnRank)
                continue
            }

            var files = [PieceType?]()
            for file in "ABCDEFGH" {
                let position = Position(rank: rank, file: String(file))
                if file == "A" || file == "H" {
                    files.append(Luke(position: position, team: team))
                }
                
                if file == "B" || file == "G" {
                    files.append(Knight(position: position, team: team))
                }
                
                if file == "C" || file == "F" {
                    files.append(Bishop(position: position, team: team))
                }
                
                if file == "D" {
                    files.append(nil)
                }
                
                if file == "E" {
                    files.append(Queen(position: position, team: team))
                }
            }
            pieces.append(files)
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
