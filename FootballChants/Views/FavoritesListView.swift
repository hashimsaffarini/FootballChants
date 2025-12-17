//
//  FavoritesListView.swift
//  FootballChants
//
//  Created by Hashim Saffarini on 17/12/2025.
//

import UIKit

class FavoritesListView: UIView, UICollectionViewDelegate {

    enum Section: Int { case main }

    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 110)
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritesCollectionViewCell.id)
        return cv
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Player.ID>!
    var onRemovePlayer: ((Player) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupDataSource()
    }

    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI() {
        addSubview(collectionView)
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Player.ID>(collectionView: collectionView) { [weak self] collectionView, indexPath, playerID in

            guard let self = self,
                  let player = FavoritesViewModel.favoritesPlayers.first(where: { $0.id == playerID }) else {
                return UICollectionViewCell()
            }

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.id, for: indexPath) as! FavoritesCollectionViewCell

            cell.configure(with: player)
            
            cell.onRemove = { [weak self] in
                self?.onRemovePlayer?(player)
            }
            
            return cell
        }
    }

    func apply(players: [Player], animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Player.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(players.map(\.id))
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
}
