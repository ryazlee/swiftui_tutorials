//
//  Board.swift
//  DuckWalker
//
//  Created by Ryan Lee on 9/13/22.
//

import SwiftUI

let cols = 10
let rows = 20

struct Board: View {
    @State var duckLoc = [5,8]
    @State var newDate = Date()

    let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    let data2 = [[Int]]()
    var columns = Array(repeating: GridItem(.flexible()), count: cols)

    var body: some View {
        let duckLocArr = getArrLoc(xLoc: duckLoc[0], yLoc: duckLoc[1])
        VStack{
            
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<cols*rows, id: \.self) { item in
                if item == duckLocArr {
                    Tile(status:1).frame(width: 60, height: 60)
                } else {
                    Tile(status:0)
                }
            }
        }.onReceive(timer, perform: { _ in
            self.duckLoc = getNextStep(xLoc: duckLoc[0], yLoc: duckLoc[1])
        })
        .padding()
        }.background(Color.blue)
    }
}

func getArrLoc(xLoc: Int, yLoc:Int) -> Int {
    return yLoc * cols + xLoc
}

func isValidDest(x:Int, y:Int) -> Bool {
    return x >= 0 && x < cols && y >= 0 && y < rows
}

func getNextStep(xLoc: Int, yLoc: Int) -> [Int] {
    let randAmount = Int.random(in: -1...1)
    let destRand = Int.random(in:0...1)
    
    if destRand == 0{
        let newLoc = [xLoc + randAmount, yLoc]
        if isValidDest(x: xLoc + randAmount, y: yLoc) {
            return newLoc
        }
    } else {
        let newLoc = [xLoc, yLoc + randAmount]
        if isValidDest(x: xLoc , y: yLoc + randAmount) {
            return newLoc
        }
    }
    return getNextStep(xLoc: xLoc, yLoc: yLoc)
}

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board()
    }
}
