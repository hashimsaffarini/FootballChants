//
//  Team.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 12/12/2025.
//

import Foundation

struct Team {
    let id : TeamType
    let name : String
    let manager : Manager
    let info : String
    let founded : String
    var youtubeLink : String {
        return "https://www.youtube.com/results?search_query=\(name)"
    }
    var isPlaying : Bool = false
    
}
