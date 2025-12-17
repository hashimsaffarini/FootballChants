//
//  FavoritesManager.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 17/12/2025.
//

final class FavoritesManager {
    
    static let shared = FavoritesManager()
    
    private init() {}
    
    private(set) var favoritePlayerIDs: Set<String> = []
    
    func toggle(playerID: String) {
        if favoritePlayerIDs.contains(playerID) {
            favoritePlayerIDs.remove(playerID)
        } else {
            favoritePlayerIDs.insert(playerID)
        }
    }
    
    func isFavorite(playerID: String) -> Bool {
        favoritePlayerIDs.contains(playerID)
    }
}
