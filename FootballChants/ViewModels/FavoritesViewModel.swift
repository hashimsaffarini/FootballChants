//
//  FavoritesViewModel.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 17/12/2025.
//

import Foundation

final class FavoritesViewModel {

    private let allPlayers: [Player] = {
        let playersViewModel = PlayersViewModel()
        return playersViewModel.dummyPlayers
    }()

    static var favoritesPlayers: [Player] = []

    func loadFavorites() {
        let favoriteIDs = FavoritesManager.shared.favoritePlayerIDs
        FavoritesViewModel.favoritesPlayers = allPlayers.filter { favoriteIDs.contains($0.id) }
    }

    func remove(player: Player) {
        FavoritesViewModel.favoritesPlayers.removeAll { $0.id == player.id }
        FavoritesManager.shared.toggle(playerID: player.id)
        
        NotificationCenter.default.post(name: .favoritesDidUpdate, object: nil)
    }

    func numberOfItems() -> Int {
        return FavoritesViewModel.favoritesPlayers.count
    }

    func player(at index: Int) -> Player? {
        guard index >= 0 && index < FavoritesViewModel.favoritesPlayers.count else { return nil }
        return FavoritesViewModel.favoritesPlayers[index]
    }
}
