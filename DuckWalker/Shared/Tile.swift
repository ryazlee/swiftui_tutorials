//
//  Tile.swift
//  DuckWalker
//
//  Created by Ryan Lee on 9/13/22.
//

import SwiftUI

struct Tile: View {
    let status: Int
    
    var body: some View {
        switch status {
        case 0:
            Text("")
        case 1:
            GIFImage("duck")
        default:
            Text("")
        }
    }
}

struct Tile_Previews: PreviewProvider {
    static var previews: some View {
        Tile(status: 1)
    }
}
