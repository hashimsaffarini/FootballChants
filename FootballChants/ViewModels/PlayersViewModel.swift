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
            id: "3",
            name: "Mohamed Salah",
            age: 33,
            number: 11,
            position: "Forward",
            photo: "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0002/02/thumb_101167_default_news_size_5.jpeg"
        ),
        
      
        
        Player(
            id: "2",
            name: "Erling Haaland",
            age: 25,
            number: 9,
            position: "Forward",
            photo: "https://static.srpcdigital.com/styles/1037xauto/public/2025-09/1203851.jpeg.webp"
        ),
        
      
        
        Player(
            id: "4",
            name: "Virgil van Dijk",
            age: 34,
            number: 4,
            position: "Defender",
            photo: "https://www.aljazeera.com/wp-content/uploads/2025/09/2025-09-17T205616Z_475710549_UP1EL9H1M5RFG_RTRMADP_3_SOCCER-CHAMPIONS-LIV-ATM-1758142887.jpg?resize=770%2C513&quality=80"
        ),
        
        Player(
            id: "5",
            name: "Bukayo Saka",
            age: 24,
            number: 7,
            position: "Forward",
            photo: "https://www.arsenal.com/sites/default/files/styles/large_16x9/public/images/saka-celeb-olympiacos_hcz1i375.png?h=5f9e3ed6&auto=webp&itok=lR9b2I4n"
        ),
        Player(
            id: "1",
            name: "Kevin De Bruyne",
            age: 34,
            number: 17,
            position: "Midfielder",
            photo: "https://i.guim.co.uk/img/media/4428df8f389237e6320571ba442f23d41951ccb5/0_400_6000_3600/master/6000.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=6da3df5fd4898113d2abc367aaeffa11"
        ),
        Player(
            id: "6",
            name: "Martin Ødegaard",
            age: 26,
            number: 8,
            position: "Midfielder",
            photo: "https://www.arsenal.com/sites/default/files/styles/large_16x9/public/images/MO_hgu4wkwt.png?h=8b6ce4d6&auto=webp&itok=61MmPSC6"
        ),
        
        Player(
            id: "7",
            name: "Cole Palmer",
            age: 23,
            number: 20,
            position: "Midfielder",
            photo: "https://static.standard.co.uk/2025/09/18/8/39/ColePalmerChelsea18092025.jpeg?trim=0,0,103,0&quality=75&auto=webp&width=1000"
        ),
        
        Player(
            id: "8",
            name: "Son Heung-min",
            age: 33,
            number: 7,
            position: "Forward",
            photo: "https://i.guim.co.uk/img/media/695be08ccc972411834346ccb50f1b5d4411ba22/49_55_2451_1471/master/2451.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=a7e210f7b4721335a9eca1b7ee2d5660"
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
