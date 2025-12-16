//
//  PlayersViewModel.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 16/12/2025.
//

import UIKit
import Kingfisher

final class PlayersViewModel : NSObject {
    let dummyPlayers: [Player] = [
        Player(
            id: "1",
            name: "Mohamed Salah",
            age: 32,
            number: 11,
            position: "Forward",
            photo: "https://media.api-sports.io/football/players/306.png"
        ),
        Player(
            id: "2",
            name: "Kevin De Bruyne",
            age: 33,
            number: 17,
            position: "Midfielder",
            photo: "https://media.api-sports.io/football/players/629.png"
        ),
        Player(
            id: "3",
            name: "Erling Haaland",
            age: 24,
            number: 9,
            position: "Forward",
            photo: "https://media.api-sports.io/football/players/1100.png"
        ),
        Player(
            id: "4",
            name: "Virgil van Dijk",
            age: 33,
            number: 4,
            position: "Defender",
            photo: "https://media.api-sports.io/football/players/33.png"
        ),
        Player(
            id: "5",
            name: "Alisson Becker",
            age: 32,
            number: 1,
            position: "Goalkeeper",
            photo: "https://media.api-sports.io/football/players/44.png"
        )
    ]
}

extension PlayersViewModel : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyPlayers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.id, for: indexPath) as! PlayerCollectionViewCell
        cell.configure(with: dummyPlayers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 10 + 10 + 10
        let width = (collectionView.bounds.width - totalSpacing) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
