//
//  Manager.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 12/12/2025.
//

import Foundation

enum JopType : String{
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name : String
    let job : JopType
}
