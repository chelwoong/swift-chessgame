//
//  Board.swift
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
                    return Pawn(team: team, position: .init(rank: rank, file: "\(file)"))
                }
                pieces.append(pawnRank)
                continue
            }

            var files = [PieceType?]()
            for file in "ABCDEFGH" {
                let position = Position(rank: rank, file: String(file))
                if file == "A" || file == "H" {
                    files.append(Luke(team: team, position: position))
                }
                
                if file == "B" || file == "G" {
                    files.append(Knight(team: team, position: position))
                }
                
                if file == "C" || file == "F" {
                    files.append(Bishop(team: team, position: position))
                }
                
                if file == "D" {
                    files.append(nil)
                }
                
                if file == "E" {
                    files.append(Queen(team: team, position: position))
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
